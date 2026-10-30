Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351705;
	b=RKv+vgcoutGaNBpY9xLoHGvE48D7T5CbPFmRhFbddciMFPIyYIFdAyjgvU4+79DUaMcf
	 vg/PhjRk8ZvYsWvJm3bNv+5hSJIBmrrhPR/rj3uME+H5qCO1LXzGYo8gEMuT4YGwBN9Oe
	 UJuZPdsj/rx7PD1WJanPW9yK31TslmAqObJscWafnGBwfaSBwYwe8w3RKc2QfLZwrGTeM
	 ZGAabbu08UphPeF4cXucNgjqI2mrYgaHFtA/VhHD5M3XO+yhIHrxxDrP7itCCR6c8bffy
	 mNvkh9uhvoYdWTr/FuY5qa/BeKyPMyHfH8ssG+4JRuqDQ5P+ft17z75VIRUhlIsJH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
	b=jZWFxFN+gAsE13Yvyv/lvsl1OQ0ZoA8rA25kd2mldhlxxU29QV8kI/L1prEwjwM9q/ry
	 REgdysADyzjLLXUJDfKuvu//9WwqxF9kSoTW9HeuH0nsBZt9M4DJLYf65MbN7pOzAGyWa
	 t3Y/4aqLjEO7QE4lZwBS4w7AyF4Eze1yj5p6JTbi1YWv7Djr5nP9C78YGTNagz5YgB+/y
	 W7+Bks8pzA6MnxUzESlZmUrB3M6+7A8q8H70fxcAmygu7xCbqK8rPpZu3QPufQbD3YRlg
	 r+ChHRrlHXKHtYfok6qXEKP0Xw5PpJdA1H9LZhjlrBa7go6oMjL+NEe7nUF+W9KqW3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggwNbcqh;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B6606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggwNbcqh
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7190aea1so2222345ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351704; x=1793956504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=ggwNbcqhxPysnARVFOm5hYRe84p4hysDACIXJyBYHZ3gfywBlWTk9IZcOATvCdlmKh
         Ak+PrxmwaHvl93tBD3QhHhSoyij4z84YuHF+xY8VSiuaEGVJ4P2TYvKzxfa1OLqYVd5A
         ViHiaJkbS1DozM2nRj4tXoVY3A5UJf+D4IBEu/MocQPb7KpU7HHcvH0VDcuvV9eRERll
         xcuwEEuFgawBIFmh96qmd2OSOuaGzh21OQdrh4fw2qmNpHTJBDtn3kgmLXqwMw8Fk/MD
         m+HQEPGTByv62feTbQxlJvS+cWORbjMWkabXxgvPh63+0dTkHRTshw8IauO1K1MweWO/
         8n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351704; x=1793956504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=0aVDMtBOO1SmOLURNBaMWWLZp/eGV5Toiz1HOFgV7JXnX+E2YmcJqK+x6e7l1CjQ4D
         w8/BAM6Mt0zK2zuuq74zjUe/81lF3q0ae238AaZ91Ov3qxm11IgyNTJb0mr4nq/qCAQr
         oxo0QcRKtXI9eeFvqtS4Xc/WG8Y+gEVjeEcHAAztLOctVB5IBoNwR/23UH/6ECPXbW62
         nuDw4j1CHKHfFCjXmgz35kfA5f0XXkRbfSNXGEgATAH1Sk/8Ea+HbacPhF9rSrU1uoWY
         dcETo4NpWWBJ+nX+bJx4FiRMWzLeykDAUwx7ex5R9J4Awch0bXwzZQy8SZd33AP1KDgM
         yHxw==
X-Forwarded-Encrypted: i=1; AKwUvBwaqaivj+8WvIhoKz/rdspTm9jThUA4/eE9DKlFzaxrcrdzcQFkbxKqogO5JHrk7CXpzhWkQfeeacWtXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkGkNw9NOtIQ7woExM8x09vpkYfN3Zq3NA11eZVWCX8LxrNJI3
	m3MPxk4Mg82w41v7ETaV49Fu1O9W2P8qkbrIkbg2HP48uKgywxz0n/na
X-Gm-Gg: AYBFou2JFaoYzfaaIg8D+iMBu5M80cAehsVCLfnO8sqA+5KphawZEy298FnHKtbSGXM
	toGuK6XnLjYp9fR0EDuK00lveCOPxKluFtbKLoB8scHh/+oR/iwT92FGt5LBY8f/EvTrXVdMIg9
	k+vTIbPFvuUEwF29YZnfQ/zOmaubZ1Rxe25Hv4O/eEU9UDHwv7SFAqtoJvvzWColYX2pgSbdYi+
	/RCSJtWNhF32phrf/RDEDfVbRzAcbtJ/5FLdzvHKYW6f/D27xV36OmDq5amLIifL19zXzlRIxSR
	XTttHdctLPwmEKPaPay/IzgBO2IieIXBqx6leUaAX4bnyoyjsk32UgzErbw3ghfKJ1ZgVl8StV+
	LXMpxe+bbrN5bm/l1d9+NgVO1SLsxOPJphB3di2Ht4IlbxPecTRf+KS3fLZNit6+K64s81Cct4b
	8JLfiMJOzuMI1jAZmUI4LBM2mht7TnazPrlenMH/GYE3X5rfHU/J381TpDkejpT14vFhevLNmjM
	30++TH429RL0ASPZpb1prVaU+f/Th6s2tvUgVfysijQyM5bdndH5E9pqQZiKXywvlD7TKIo1obp
	PH8Xoaiid/sR1RU5/Fmsrmd/nYmpXvWcfz67m0lUSkhTLYgCFvntbVQOoUSCji7P2tfr2wq1epx
	PFWO/dW+3kpIsPXoF3R4AAG5LMwczLhJUfF2JHsiAX7wsH3Uf6C/w4Oe1eTe1A+T11A==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr17350985ad.24.1793351703935;
        Fri, 30 Oct 2026 02:15:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: fsl_sai: Propagate device tree property read errors
Date: Fri, 30 Oct 2026 16:14:03 +0700
Message-ID: <20261030091404.18757-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original error codes from of_property_read_u32_index()
instead of replacing them with -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5532fab80be0..cb07e7d13132 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1495,15 +1495,15 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 		 */
 		ret = of_property_read_u32_index(np, propname, index++, &type);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &rx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &tx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		if ((rx & ~soc_dl) || (tx & ~soc_dl)) {
 			dev_err(dev, "dataline cfg[%d] setting error, mask is 0x%x\n", i, soc_dl);
-- 
2.43.0

