Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0434D4F9
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965789; cv=none; b=EymgYq0kjtG1hAF20Ev6LtOU/Q+CNzwiqf2u+18cUkpWTqxLOYNFjn3S8pBRlNtoeOaloeGSqF8hqjCftSVBRNadxYV+U11Z+z1xT1PXOSoCfoX9/WIfKXPCLtKXKIydZhD1U20rzc1bk0bByyz9iGo24uWMDGIZOp4+aNvaxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965789; c=relaxed/simple;
	bh=Ky52XW8fSk/a/Nb5c4oklbUXT2kU5yuJ/10d5eklp/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5k4oivN17HisBOePs4Np6NKkPfW6i7up18ZSEeiMwegssmkl4fYSdia1PDip5QD03+/H2vxXycJARkYY30Gf6uTcx+DMl+krO/RE+sRuD7W/ujh4+jeao59XUxtCTyUo2tTCDeVNVaO1bq4WxdMOszPetQFF8h1pnlpZDmRCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BpyMQXOH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BpyMQXOH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jmiwow2FeM59Lz+LoM90d59f17iMEQ1ZPX2yD1jZaOo=; b=BpyMQXOH3jHAjmE0X2XAhy0J47
	ITnXR2Dgjycs1OFq9J6sWj+oaLCM7Es4KzrwXI/ftBvILeCArcXt3LdRTE4hjJrcdtd2jA0S3giov
	sKIPvE/7kVjT5QqBxswRfjbS7TUikjVdP2rrRQC20Zuvh4AqJOvIkCfSrUFhv86E+EIcuzLxrJ7SW
	mw+rMtXDs13J2HkXaX927nO00hfKqlp+AzzchlH3McehLairZ7oalf1A0GssZ6e8L+eDcTxNkh8c6
	RBSkG5eiSItVS2A2bovbznewOpPOZ7crhFykBR4SuZUfmXcBb4vRyqG77iUJrMawcZtIJ2U/0HeYE
	EPZ+QMNw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKzi-0000000AAVv-2aRH;
	Mon, 13 Jul 2026 18:03:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ALSA: hda: regmap: fix all kernel-doc warnings
Date: Mon, 13 Jul 2026 11:03:01 -0700
Message-ID: <20260713180303.526409-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713180303.526409-1-rdunlap@infradead.org>
References: <20260713180303.526409-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- add missing function parameter descriptions
- drop some incorrect function parameter descriptions
- add missing function Return value sections
- use the correct function prototype names in the comments

These changes avoid many warnings (examples):

Warning: include/sound/hda_regmap.h:80 function parameter 'codec' not described in 'snd_hdac_regmap_write'
Warning: include/sound/hda_regmap.h:80 function parameter 'verb' not described in 'snd_hdac_regmap_write'
Warning: include/sound/hda_regmap.h:80 Excess function parameter 'reg' description in 'snd_hdac_regmap_write'
Warning: include/sound/hda_regmap.h:80 No description found for return value of 'snd_hdac_regmap_write'
Warning: include/sound/hda_regmap.h:99 function parameter 'codec' not described in 'snd_hdac_regmap_update'
Warning: include/sound/hda_regmap.h:99 expecting prototype for snd_hda_regmap_update(). Prototype was for snd_hdac_regmap_update() instead
Warning: include/sound/hda_regmap.h:116 expecting prototype for snd_hda_regmap_read(). Prototype was for snd_hdac_regmap_read() instead
Warning: include/sound/hda_regmap.h:116 function parameter 'codec' not described in 'snd_hdac_regmap_read'
Warning: include/sound/hda_regmap.h:137 function parameter 'dir' not described in 'snd_hdac_regmap_get_amp'
Warning: include/sound/hda_regmap.h:137 Excess function parameter 'direction' description in 'snd_hdac_regmap_get_amp'
Warning: include/sound/hda_regmap.h:137 No description found for return value of 'snd_hdac_regmap_get_amp'
Warning: include/sound/hda_regmap.h:161 function parameter 'dir' not described in 'snd_hdac_regmap_update_amp'
Warning: include/sound/hda_regmap.h:161 Excess function parameter 'direction' description in 'snd_hdac_regmap_update_amp'
Warning: include/sound/hda_regmap.h:161 No description found for return value of 'snd_hdac_regmap_update_amp'
Warning: include/sound/hda_regmap.h:182 function parameter 'dir' not described in 'snd_hdac_regmap_get_amp_stereo'
Warning: include/sound/hda_regmap.h:182 Excess function parameter 'ch' description in 'snd_hdac_regmap_get_amp_stereo'
Warning: include/sound/hda_regmap.h:182 No description found for return value of 'snd_hdac_regmap_get_amp_stereo'
Warning: include/sound/hda_regmap.h:206 function parameter 'dir' not described in 'snd_hdac_regmap_update_amp_stereo'
Warning: include/sound/hda_regmap.h:206 Excess function parameter 'direction' description in 'snd_hdac_regmap_update_amp_stereo'
Warning: include/sound/hda_regmap.h:206 No description found for return value of 'snd_hdac_regmap_update_amp_stereo'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 include/sound/hda_regmap.h |   42 +++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

--- linext-2026-0710.orig/include/sound/hda_regmap.h
+++ linext-2026-0710/include/sound/hda_regmap.h
@@ -69,11 +69,14 @@ void snd_hdac_regmap_sync(struct hdac_de
 
 /**
  * snd_hdac_regmap_write - Write a verb with caching
+ * @codec: HD-audio codec base device
  * @nid: codec NID
- * @reg: verb to write
+ * @verb: verb to write
  * @val: value to write
  *
  * For writing an amp value, use snd_hdac_regmap_update_amp().
+ *
+ * Returns: %0 if successful or a negative error code.
  */
 static inline int
 snd_hdac_regmap_write(struct hdac_device *codec, hda_nid_t nid,
@@ -85,13 +88,16 @@ snd_hdac_regmap_write(struct hdac_device
 }
 
 /**
- * snd_hda_regmap_update - Update a verb value with caching
+ * snd_hdac_regmap_update - Update a verb value with caching
+ * @codec: HD-audio codec
  * @nid: codec NID
  * @verb: verb to update
  * @mask: bit mask to update
  * @val: value to update
  *
  * For updating an amp value, use snd_hdac_regmap_update_amp().
+ *
+ * Returns: %0 if successful or a negative error code.
  */
 static inline int
 snd_hdac_regmap_update(struct hdac_device *codec, hda_nid_t nid,
@@ -104,12 +110,15 @@ snd_hdac_regmap_update(struct hdac_devic
 }
 
 /**
- * snd_hda_regmap_read - Read a verb with caching
+ * snd_hdac_regmap_read - Read a verb with caching
+ * @codec: HD-audio codec
  * @nid: codec NID
  * @verb: verb to read
  * @val: pointer to store the value
  *
  * For reading an amp value, use snd_hda_regmap_get_amp().
+ *
+ * Returns: %0 if successful or a negative error code.
  */
 static inline int
 snd_hdac_regmap_read(struct hdac_device *codec, hda_nid_t nid,
@@ -125,12 +134,12 @@ snd_hdac_regmap_read(struct hdac_device
  * @codec: HD-audio codec
  * @nid: NID to read the AMP value
  * @ch: channel (left=0 or right=1)
- * @direction: #HDA_INPUT or #HDA_OUTPUT
- * @index: the index value (only for input direction)
- * @val: the pointer to store the value
+ * @dir: #HDA_INPUT or #HDA_OUTPUT
+ * @idx: the index value (only for input direction)
  *
  * Read AMP value.  The volume is between 0 to 0x7f, 0x80 = mute bit.
- * Returns the value or a negative error.
+ *
+ * Returns: the value or a negative error.
  */
 static inline int
 snd_hdac_regmap_get_amp(struct hdac_device *codec, hda_nid_t nid,
@@ -148,13 +157,14 @@ snd_hdac_regmap_get_amp(struct hdac_devi
  * @codec: HD-audio codec
  * @nid: NID to read the AMP value
  * @ch: channel (left=0 or right=1)
- * @direction: #HDA_INPUT or #HDA_OUTPUT
+ * @dir: #HDA_INPUT or #HDA_OUTPUT
  * @idx: the index value (only for input direction)
  * @mask: bit mask to set
  * @val: the bits value to set
  *
  * Update the AMP value with a bit mask.
- * Returns 0 if the value is unchanged, 1 if changed, or a negative error.
+ *
+ * Returns: 0 if the value is unchanged, 1 if changed, or a negative error.
  */
 static inline int
 snd_hdac_regmap_update_amp(struct hdac_device *codec, hda_nid_t nid,
@@ -169,13 +179,12 @@ snd_hdac_regmap_update_amp(struct hdac_d
  * snd_hdac_regmap_get_amp_stereo - Read stereo AMP values
  * @codec: HD-audio codec
  * @nid: NID to read the AMP value
- * @ch: channel (left=0 or right=1)
- * @direction: #HDA_INPUT or #HDA_OUTPUT
- * @index: the index value (only for input direction)
- * @val: the pointer to store the value
+ * @dir: #HDA_INPUT or #HDA_OUTPUT
+ * @idx: the index value (only for input direction)
  *
  * Read stereo AMP values.  The lower byte is left, the upper byte is right.
- * Returns the value or a negative error.
+ *
+ * Returns: the value or a negative error.
  */
 static inline int
 snd_hdac_regmap_get_amp_stereo(struct hdac_device *codec, hda_nid_t nid,
@@ -192,14 +201,15 @@ snd_hdac_regmap_get_amp_stereo(struct hd
  * snd_hdac_regmap_update_amp_stereo - update the stereo AMP value
  * @codec: HD-audio codec
  * @nid: NID to read the AMP value
- * @direction: #HDA_INPUT or #HDA_OUTPUT
+ * @dir: #HDA_INPUT or #HDA_OUTPUT
  * @idx: the index value (only for input direction)
  * @mask: bit mask to set
  * @val: the bits value to set
  *
  * Update the stereo AMP value with a bit mask.
  * The lower byte is left, the upper byte is right.
- * Returns 0 if the value is unchanged, 1 if changed, or a negative error.
+ *
+ * Returns: 0 if the value is unchanged, 1 if changed, or a negative error.
  */
 static inline int
 snd_hdac_regmap_update_amp_stereo(struct hdac_device *codec, hda_nid_t nid,
