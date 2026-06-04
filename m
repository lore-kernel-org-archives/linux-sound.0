Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789B3BB69B
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548512; cv=none; b=dC5sHtBDbwJ64yLHVhTDs8bSNQqUnX0TC6KbfvD1CHj3/Sj2C/xOURCKIHeHwbhj/L3LQMFKBYdnK2JJFA8ufGZ6D1uh7MIpxUxzyV3ZMCxUT9qnnpdSKPg+DQO6tNyugechDO3UbUcGxEVfBDsVnF0PuIgjDdHsJpK+R9iMRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548512; c=relaxed/simple;
	bh=pWbCF+sZl0uQ/lzRIyaualcjXCgu58io4Oti/Ugl46s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7pldZEurQ3QmFI3IzWrZhHeWu6aZvYXyzfVMcbDFOsXYdbry+XzCEGorsH18IzBq8XAmG3w1WCEGjtPFQKfSuJgUlSVfjH7Qv9Q4hAIokUthVtxPqHZo+AfRydd3hodTDKSFIY5P96PlEZ6P/yl095nVmrdCgPE73SzEZSfnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6oBdVAL; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6oBdVAL"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137eed84fc6so843770c88.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 21:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780548511; x=1781153311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzJi/3t9podZ1eY2BcQ1xp9rGrOu2MtvnNbrPxkGLpI=;
        b=i6oBdVALZxafh4cAO+5PKyvduBIP19wpTKAh/pa7G+XRapltFk2j5E6YiFStC2n5h7
         TohmPOQvuFtBsveKAfgbLfBOeDCAZoO8cLsnusc1WAVWmY6jWoONgLTm1/kZzJMzvBmL
         5QlxmJKEF6/a7GTGPIondXbl19zI3o1rvO90gCcc7y1xhOqQRrqKV4maWnXoEizL3YOJ
         pC9JUHyfs0i+7pGXFz2GtGstKyWvG2S5j7rz3N5qddXahyB9LvAa++EdDnG1ijO3Dlyj
         WKPqlMWJ09+jIdLP6vfD8TMA4UQIrL2naKEGZEIb+EI95HIosdTcwTo/J22ttGtEPKnv
         Aaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780548511; x=1781153311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzJi/3t9podZ1eY2BcQ1xp9rGrOu2MtvnNbrPxkGLpI=;
        b=qhDFORO39kwu/cuKEE2ZEY7vl3JD1qfvnWYTvzTCbmXjMHh7aTrXww/Ildhxr/fw3u
         xrZVRuP8WRAvPQndg7SAOd+vajfu1zPY82Q2pFVC4F4mVXGcZJIxrn6s1R40uoFhXrJc
         YKFRYuEvK8DuMH3TdMwPgWZFWogw00XjviLqCRCqG5ihn1cecoP2o4teq7hD5oYDrMVa
         j9tfsqBMhZbN9t2ZPgGk87U3m7bAII5j2vGpiB6xiaBYohUVhSuzR3feeGVmERjBJyt5
         foDMxUfA9B1FEYrlhD2GBJHkNHaVXhLvhI2zkzcWPL1TC7jrge6LobG6uNN9M4yYJqvy
         Lviw==
X-Gm-Message-State: AOJu0YzSccOo2yn6qZTuSgBD7xzv87pSGzulvz5UsZ1ojhlvjtO9K7Cd
	pXWFDv8uni1TzfL6ys15mZFQhoACLWBrVHwg5Dpa/CxswEYwFuDE4TTt
X-Gm-Gg: Acq92OEGaWOjru0NPior5/tyZjYOGvgMYJj4sk150bEKMAdXKR+UVvOE51DZT9jf6eY
	Jv3XERaTk7vQ5haaQHFVXX2d4j9dvSdODoPDbJq2MkJ+RjG5y4OryQq3bOwYUHrTqvzF59QOlqS
	41Tjxpv/KjUxDvEHIDGe0ysuaWCHADOGvgtnGBdMkftBzqFLDVv38xh3+zDdfown/gz9kG/im0q
	pIsNnkf6WNgdvlROSmqwQiE8EYX8E4UGkCJLSn9C0pz5U07GTOzqf3X2Ud2enZhvdUvsafzvvzK
	W714iFTtH+kDr7vPFAj7oIxKaw4goeGjY6Ybs0U1cuS0lhaLHQee3ZxQQ05RoD0QxqBZ3sVBreu
	eC1xnxcJfJlj2O/uFEsuEOjtDOOcvugzK1ZrGmd16HGdK6zWAvOvdBrJ/pKWUlSfTMjuaabZgF6
	oepXUPEm5cg0RDtDRcgr63ZVS8/R9EDjs7qU7RcXXKVbD6+1vjJ0HaD2ZfMrpz0AaT82vhZotHq
	VZCvF4GuIJ+
X-Received: by 2002:a05:7300:dc8c:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3074f843547mr3241214eec.0.1780548510304;
        Wed, 03 Jun 2026 21:48:30 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm3815039eec.10.2026.06.03.21.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:48:29 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 04 Jun 2026 01:48:12 -0300
Subject: [PATCH 1/3] ALSA: control: Use scoped cleanup for user control
 buffers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-alsa-scoped-cleanups-v1-1-10c43152a728@gmail.com>
References: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
In-Reply-To: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3686;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=pWbCF+sZl0uQ/lzRIyaualcjXCgu58io4Oti/Ugl46s=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmKzDMUjkrqxBpp67FbFvCd0F5259sSuXDTG3qd5p8K7
 krX5OZ3lLIwiHExyIopsqxOWmS5p+vB1fq4FR4wc1iZQIYwcHEKwETEghn+x51kLnovazuhYL5W
 5LlN3n2vXxzT7r+XzrE+/SXD3fIyLYZ/picn1y9bdSH76Jopc9MkjTX6Hu3W3LdsclzFhuWfluy
 5zAIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

User-defined control TLV data and enum names are copied from user space
with vmemdup_user() before being installed in the user_element. Until
ownership is transferred, these temporary buffers have to be released on
every validation exit.

Use __free(kvfree) for the temporary buffers and no_free_ptr() when
ownership is transferred to the user_element. This removes the manual
kvfree() calls from the unchanged-TLV and enum-name validation paths,
makes the ownership hand-off explicit, and keeps the existing allocation
accounting and ABI unchanged.

No functional change is intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/control.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 5e51857635e6..28fffbe92e66 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1550,7 +1550,6 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 			    unsigned int size)
 {
 	struct user_element *ue = snd_kcontrol_chip(kctl);
-	unsigned int *container;
 	unsigned int mask = 0;
 	int i;
 	int change;
@@ -1564,17 +1563,16 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	if (check_user_elem_overflow(ue->card, (ssize_t)(size - ue->tlv_data_size)))
 		return -ENOMEM;
 
-	container = vmemdup_user(buf, size);
+	unsigned int *container __free(kvfree) = vmemdup_user(buf, size);
+
 	if (IS_ERR(container))
 		return PTR_ERR(container);
 
 	change = ue->tlv_data_size != size;
 	if (!change)
 		change = memcmp(ue->tlv_data, container, size) != 0;
-	if (!change) {
-		kvfree(container);
+	if (!change)
 		return 0;
-	}
 
 	if (ue->tlv_data == NULL) {
 		/* Now TLV data is available. */
@@ -1587,7 +1585,7 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 		kvfree(ue->tlv_data);
 	}
 
-	ue->tlv_data = container;
+	ue->tlv_data = no_free_ptr(container);
 	ue->tlv_data_size = size;
 	// decremented at private_free.
 	ue->card->user_ctl_alloc_size += size;
@@ -1628,7 +1626,6 @@ static int snd_ctl_elem_user_tlv(struct snd_kcontrol *kctl, int op_flag,
 /* called in controls_rwsem write lock */
 static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 {
-	char *names, *p;
 	size_t buf_len, name_len;
 	unsigned int i;
 	const uintptr_t user_ptrval = ue->info.value.enumerated.names_ptr;
@@ -1641,27 +1638,28 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 
 	if (check_user_elem_overflow(ue->card, buf_len))
 		return -ENOMEM;
-	names = vmemdup_user((const void __user *)user_ptrval, buf_len);
+	char *names __free(kvfree) = vmemdup_user((const void __user *)user_ptrval,
+						  buf_len);
+
 	if (IS_ERR(names))
 		return PTR_ERR(names);
 
 	/* check that there are enough valid names */
-	p = names;
+	char *p = names;
+
 	for (i = 0; i < ue->info.value.enumerated.items; ++i) {
-		if (buf_len == 0) {
-			kvfree(names);
+		if (buf_len == 0)
 			return -EINVAL;
-		}
+
 		name_len = strnlen(p, buf_len);
-		if (name_len == 0 || name_len >= 64 || name_len == buf_len) {
-			kvfree(names);
+		if (name_len == 0 || name_len >= 64 || name_len == buf_len)
 			return -EINVAL;
-		}
+
 		p += name_len + 1;
 		buf_len -= name_len + 1;
 	}
 
-	ue->priv_data = names;
+	ue->priv_data = no_free_ptr(names);
 	ue->info.value.enumerated.names_ptr = 0;
 	// increment the allocation size; decremented again at private_free.
 	ue->card->user_ctl_alloc_size += ue->info.value.enumerated.names_length;

-- 
2.54.0

