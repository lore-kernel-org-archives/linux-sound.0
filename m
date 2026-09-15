Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9C34A5C55
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461933; cv=none; b=X89UCKoRIE8oZrXZjrBdFyg3TvHEImTymD5IQULXiUC/TIoN32Ql65g4YqZ7Yhl4bUS3q21cFCosp0z/D74/pj1fPaZCgUHKcNZoQhFvX8r80x/nSu5c9nwOEWRwqjOXVXxYsw9gc7Cn6Yhigo4QnQPWEbbIBMMxZozt5gAWdEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461933; c=relaxed/simple;
	bh=ZrgMB7JDDSdafyviRdJlDugq/cgi4D4vxT6ZDCo/aq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq5kRtDJJG+IhgLlqH5L0jZDrEoucb2AQip9mgWyzybjhA5p/mIvRiuQ2Bva8ujOVLM0sPp/EXDFoE53SYuC8TF46KTs1KUtl/0q+gbjec5W/o4Cs1GE5O3VjXlvT327MuJfnOZhmtRr2pO3kun/rHtLmqgFc1J1c+xLUPvPkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CN0zW5Mg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CN0zW5Mg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8692be1cda4so3548033b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461931; x=1790066731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZjVI056W5CWRBLEP/aWUKLbuQzjdA8fAad1ODHQ2ro=;
        b=CN0zW5MggNo/nhTbR8VI7iWX5DeFAGbjXebPk+v5phTM7A4D5pKM3CgpGty6Utcc4v
         bil2MphDTgyfrefzmPXRo9RT4nc8q7sHOAxwLzClinlqi90M4jUixELFRxQZBDmJfgnv
         ebFdtXKkbgd1lFpFjUXdejTSRjgjiOY3qKNsWrKVX/54156y+s3agOLYDtsbmHfoknWq
         mmQ8WmEg8ByZ1QBHl9J8zD0z7U9AcoJ4A21MpyO9UX2tHKPUvBEplgT1iimCJLhcNSfy
         Rq80xKxhXjlcLpc6MrgGAo0Gbre1u/mOT2jLulEukuMSYcpEUztUytjzXLQekpbscvgo
         I1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461931; x=1790066731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZjVI056W5CWRBLEP/aWUKLbuQzjdA8fAad1ODHQ2ro=;
        b=Nq4sjcA7R07TbADyxo5wlD7rzc9Si5NSg5uE8DhrKg31NVMJ+bmhZbyTcEIeE84U7U
         caurq85em3ODnhy0YaWCorbg2cOu/9/ZCG5FTr2DYL7n0GPJ9DogfUsUSKddtgaaBZbx
         58ZxT6uzZsFxcij7a103ZUWIGQVTvdQ50dsCRJvsRwhbfl2UXDItOgvC0AAKBv+XJ6Lc
         G7upiizOL/s3A/5I2QutC8Qda9LMHrw66aYH7OrxZ3MSqfpnWnGhcOuqc7eHrCZMp+xO
         5ACvNaSe9LTB0liThaNf6TGyIugS0ApYnJe3sKKqygDOL3AN8FxZCCSufTr2PJUunTM6
         znvg==
X-Gm-Message-State: AFuF++m0Fj/UeEGFlkPHsIB4OllTWhQxYplwJ/o9zpYvZfllMsc+jMY7
	fcHW3sRyo4v9r7BAFUERZtnHeNE/VgVIr0jNOcqVnNkpGprcTdLZjeoACGtqLw==
X-Gm-Gg: AYBFou3bvKDmWJUnKWqdWNW+42kkG8tWyi8rnPSpIBtMHORomBh6qEaCB7bn+5MDxcl
	DrtJ1OHXgxGM20dROQ7vKCf/kpihlmXUMZt4vqGxc7Lat3GlmAU3x1L6cYzs5ScGBeeHLv4jqMu
	9KFLZh3ygK/TeQCrTEwE27XsDIRK8xOXXL0YZA4qOkQnI8uvs+NsFWYUoJRwYWmAckmzDn0xh2B
	XJmT5YMOHUukkVB/+9wBwS6eVvLegyjqXCa2WcIPwCu/T0cG4YZuBILjPFFVgtWI1YMtL/pI5Wa
	HW1xjT/Kmd1QA9lt2pBGQ6yvPWh/3kU8BFesSI/IRBl4uunmcV4VdgR3W4KM48l1dN+PAkXoGS/
	c3PptOvD/rPcgXLIhSfGwH2xL22wjz29P/6tZ4f8mcK2Bb3J4yiAAAN3uWPAib4mMGVqBQslDth
	kggyRebVfokxpB3elQIssKxGzmNbAP4WG8ovrlpFeoyWnjQJTUZSO3lpdJODrfU5GztClj94GkM
	4eX0mHzJ33S/m8JVape6O+eag==
X-Received: by 2002:a17:90b:4c41:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39dec05d384mr12362719a91.15.1789461931352;
        Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 22/23] ALSA: trident: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:23 +0530
Message-ID: <20260915084424.1007757-23-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/trident/trident_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 81f6348191dc..4ed0e7d68322 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -27,7 +27,7 @@
 #if PAGE_SIZE == 4096
 /* page size == SNDRV_TRIDENT_PAGE_SIZE */
 #define ALIGN_PAGE_SIZE		PAGE_SIZE	/* minimum page size for allocation */
-#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maxmium aligned pages */
+#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maximum aligned pages */
 /* fill TLB entrie(s) corresponding to page with ptr */
 #define set_tlb_bus(trident,page,addr) __set_tlb_bus(trident,page,addr)
 /* fill TLB entrie(s) corresponding to page with silence pointer */
-- 
2.48.1

