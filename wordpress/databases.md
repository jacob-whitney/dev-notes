# Useful WordPress Database Queries

## Posts

**wp_posts** | See every post created on the WordPress site, including custom post types and pages.
- Make sure to limit broad ``SELECT`` queries because **wp_posts** is quite large
- Most useful fields are ID, post_author, post_content, post_title, post_status, and post_type
- Does not contain taxonomies and other meta data. For taxonomy data, see **wp_term_relationship**, **wp_terms**, and **wp_term_taxonomy**. For meta data, see **wp_postmeta**.


View all existing post types
```
SELECT DISTINCT 
  post_type 
FROM 
  wp_posts;
```
View posts of a specific post type
```
SELECT
  *
FROM 
  wp_posts
WHERE
  post_type='<post-type>'
```

**wp_postmeta** | !INCOMPLETE
Select columns from multiple tables
```
SELECT 
  wp_posts.ID, 
  wp_posts.post_title, 
  wp_postmeta.meta_value, 
  wp_posts.post_status 
FROM 
  wp_posts 
INNER JOIN 
  wp_postmeta 
ON 
  wp_posts.ID = wp_postmeta.post_id 
WHERE 
  wp_postmeta.meta_key='library_link' 
  AND wp_posts.post_type='article_database';
```


## Terms & Taxonomies

Terms | Categorizing labels for posts and other content types. 

Taxonomies | Types of terms, like tags, post categories, and custom taxonomies.
-  Custom taxonomies can be registered or created with plugins like ACF. Examples include faq_topic or branch_amenities

**wp_term_relationship** | See all taxonomy terms assigned to a post. Each record contains a post's ID (object_id) and one term (term_taxonomy_id) selected for that post. 

<img src="../images/select_wp_term_relationship.png" alt="Example output of wp_term_relationships table" width="500">

**wp_terms** | See all taxonomy terms used with their term_id, name, and slug

<img src="../images/select_wp_terms.png" alt="Example output of wp_terms table" width="500">

**wp_term_taxonomy** | See taxonomy and description assigned to each term.

<img src="../images/select_wp_term_taxonomy.png" alt="Example output of wp_terms table" width="500">

### Useful Queries

View all of a post's selected term names and their taxonomies
```
SELECT 
  wp_posts.ID, 
  wp_posts.post_title, 
  wp_posts.post_status,
  wp_term_taxonomy.taxonomy,
  GROUP_CONCAT(wp_terms.name SEPARATOR ', ')
FROM 
  wp_posts
INNER JOIN 
  wp_term_relationships ON wp_posts.ID = wp_term_relationships.object_id 
INNER JOIN
  wp_terms ON wp_term_relationships.term_taxonomy_id = wp_terms.term_id
INNER JOIN 
  wp_term_taxonomy ON wp_terms.term_id = wp_term_taxonomy.term_id
WHERE 
  wp_posts.ID=<post_id>
GROUP BY
	wp_posts.ID,
  wp_posts.post_title,
  wp_posts.post_status,
  wp_term_taxonomy.taxonomy;

# Filter by different post types instead
WHERE
  wp_posts.post_type='<post-type>'
```