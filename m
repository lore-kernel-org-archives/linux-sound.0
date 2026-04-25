Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525DD3E47B
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 02:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084481; cv=none; b=k2ewfHwF8sNwMqq2qZcZ/OvWMjf0FN9wjT6gUqAIVhTPIjYmrvsqGGM6ZDDLyPl0rQLZSknJrIA3HWDGXnZdIAQ/IGGYok+4MuIg4PMl5m0QT7mgdvSoe0bnHuWODSDMUKyrXpk1XHCo+XrnMJyHiLiwnRHy460SN0CZbWF5AWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084481; c=relaxed/simple;
	bh=v9HVJ++03EQaHXhNmsfjEsq0XxSkjXdwD14D6W+Pb0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmmNnUN51sgBZ2W93GRbWXnOUOS1O5XwBP1/c7n9sBj1LlWe9HGuxswsXecUL6ArajTAy3zlu0J4pf6v4sndAwp4MdGIHHqa5yPXvgy6wk5LG85BzMEdaaQBViCOhHtC70Ly2p4DXN4NBT/XtWtyhKH7vtLGQfCNxDoLKi70FjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svYEN0ie; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svYEN0ie"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso5359285a91.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 19:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777084479; x=1777689279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAbYB02520Q6y8pD6pZNW6/14rOdlhFt3EiI3dE8eTE=;
        b=svYEN0ieLEvjC+Iz8a815CSCcLSXRJxmgcZ+2vTmnBC5743zAtpqGwU6ADkatsNIqT
         a8OUR/LRkoeG26rWUoHIEt3MFHyQxBQPDs6jUpT3s0AWqvQp/XIwm8vjr06CylyupKt1
         0v8hnk0avLKOV1QT7fzC3oj7YrgIjLw6Bp5PZGK8Bju1ef1votHSJLKdodPkqMiIF+RX
         ZmCN+pgWD/LkGhrImAcs9USHovNBMCIQpeznPFpwvZnbV4AQ9p4AjJdQphk61E/pf6we
         zFYSEyP0F9xBcY7bA/lStQojWbX+LY4O1uAtPDcLxmR5PwdOJaqoLSQvfF690nR61Mdn
         tbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777084479; x=1777689279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAbYB02520Q6y8pD6pZNW6/14rOdlhFt3EiI3dE8eTE=;
        b=Ev0s8BrEkurmd/xj6FdJhy2KqHzxtjyX+xymgmGxzY82BsVEWvcfiwh4T0zaJbV4oI
         hrnE8vDfb8zgV/KBhpHtyoZwGOcrCvqX/FFjlmW1hvlOODQPnwdor7GHSoLfPZy76Co7
         H4HTf/FcCYbsVzGAKopakFm0esBCpFZCkDZLJpIvyzihMyyDeFyWaghe1BV4z/IWY65y
         QfbtNFC9f718o6BcogVKpycPp50b+8ZZriwWZdVC7ugtp/EjTEuha1HfgG5ZOEgO5FQR
         3EFLyz5VRcb92PRxrUvMHXIzkiheCekA79DZld6wGy//msQzjzSeDvlyPXssjgnmvy4A
         n4Vg==
X-Gm-Message-State: AOJu0YyoKb7YOg5yJL+Dnxg81wvkzeC9tb+fQJzbEfE5xoPFrWlXwKnz
	QteDg6sCe+9LXNyU5CaMdPHi1yI7DZRERECKJrtbZzlw3ARzP1Vzuh+/WVkcCoKy
X-Gm-Gg: AeBDietCk6+NU0Koesa4l/yn5Mtmf0mrF/sb5RL6fbMdYZ20PlaeTuPI3V/VkvEE1fh
	d8WbiOBHz4hTdobOwFBl6C7f4/wRAbAQfGoLQnIl6ZMSRjN7QfsFOGZPutkWYMUQbqs1gKww43+
	2mBWLnI9/LsIiz7StBweqJxxBwwFdkGNLjeZHjtxopP3AVgM4AIzjiS4ELlT1hIVO3/PSLdCv/I
	Q1Wr1lu6DwWD2c5mq+V/6C+21t4MYjNF5EHFleTI00JU2cV4LZDbFZB7OvabszxaVy8993i5X7d
	wrzPV994q63qS6QGBDjdn804Ycf4NXLakZkMkNNV/wgM62sxo4K+wVEbEVco1yEHJVrPWDy/6E5
	N9+lO2g09OKAvbcqsvD5M/m8OOuWj6D3NizkxvKm8AXSdcF3kIGItfe1gtIyVI1Ef6A0EB0u62R
	OHpClu7zvBztviAZNXYrjYytMxLdiifNQrauBsitEeiG7efkHB7t4VrB5TcWn+AEhAGOsDlkIFG
	OvGUCB2Tr8Emzy68S40pJKLng==
X-Received: by 2002:a17:90b:2fc8:b0:35d:a542:2dc4 with SMTP id 98e67ed59e1d1-3614047a7b8mr37015722a91.21.1777084479375;
        Fri, 24 Apr 2026 19:34:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fa91d31sm12977009a91.2.2026.04.24.19.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 19:34:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: hda: allocate nodes with tree
Date: Fri, 24 Apr 2026 19:34:21 -0700
Message-ID: <20260425023421.476334-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations. Simplifies
allocation and freeing.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/hda/core/sysfs.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/sound/hda/core/sysfs.c b/sound/hda/core/sysfs.c
index 3e102538e058..f14ce1203a9f 100644
--- a/sound/hda/core/sysfs.c
+++ b/sound/hda/core/sysfs.c
@@ -13,7 +13,7 @@
 struct hdac_widget_tree {
 	struct kobject *root;
 	struct kobject *afg;
-	struct kobject **nodes;
+	struct kobject *nodes[];
 };
 
 #define CODEC_ATTR(type)					\
@@ -325,11 +325,8 @@ static void widget_tree_free(struct hdac_device *codec)
 	if (!tree)
 		return;
 	free_widget_node(tree->afg, &widget_afg_group);
-	if (tree->nodes) {
-		for (p = tree->nodes; *p; p++)
-			free_widget_node(*p, &widget_node_group);
-		kfree(tree->nodes);
-	}
+	for (p = tree->nodes; *p; p++)
+		free_widget_node(*p, &widget_node_group);
 	kobject_put(tree->root);
 	kfree(tree);
 	codec->widgets = NULL;
@@ -366,7 +363,7 @@ static int widget_tree_create(struct hdac_device *codec)
 	int i, err;
 	hda_nid_t nid;
 
-	tree = codec->widgets = kzalloc_obj(*tree);
+	tree = codec->widgets = kzalloc_flex(*tree, nodes, codec->num_nodes + 1);
 	if (!tree)
 		return -ENOMEM;
 
@@ -374,10 +371,6 @@ static int widget_tree_create(struct hdac_device *codec)
 	if (!tree->root)
 		return -ENOMEM;
 
-	tree->nodes = kzalloc_objs(*tree->nodes, codec->num_nodes + 1);
-	if (!tree->nodes)
-		return -ENOMEM;
-
 	for (i = 0, nid = codec->start_nid; i < codec->num_nodes; i++, nid++) {
 		err = add_widget_node(tree->root, nid, &widget_node_group,
 				      &tree->nodes[i]);
@@ -435,12 +428,6 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec,
 	if (!tree)
 		return -ENOMEM;
 
-	tree->nodes = kzalloc_objs(*tree->nodes, num_nodes + 1);
-	if (!tree->nodes) {
-		kfree(tree);
-		return -ENOMEM;
-	}
-
 	/* prune non-existing nodes */
 	for (i = 0, nid = codec->start_nid; i < codec->num_nodes; i++, nid++) {
 		if (nid < start_nid || nid >= end_nid)
@@ -459,7 +446,6 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec,
 	}
 
 	/* replace with the new tree */
-	kfree(codec->widgets->nodes);
 	kfree(codec->widgets);
 	codec->widgets = tree;
 
-- 
2.54.0

