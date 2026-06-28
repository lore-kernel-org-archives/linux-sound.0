Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B53A544A
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782647007; cv=none; b=E8oBTmBYztaZwHsfQ3uZGYC23GL9FWlJAt5XmYK+qijUqCdYEoAHSnSg8SUINue/Wl1OsR08wTB7EmRVFlvvAEWfMU66QfAXfvKfUM8t9ucU0AzbwW8pnfZcXbq+e8G2iI7n8T5gBs58pz1UV4nWZe7FEcDwkw+fyseZWazg4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782647007; c=relaxed/simple;
	bh=f9Z8Po5dG+RGUXsODFlcTQisxKau0phFttvagFoIj8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKES0mP2gq1Nt3tTO3o/QHonKhHpuvyVHDMPzVBLWcf/EbnPjCdxokoeX/Jijoa2eVCYDqs5tgLnnPHrzKF4qxyRz0Gn0byZF9ytES5Jggk2E2si1rag48jrF5dnGrkPZ1kgj7+8XC6S8AzNO3tfNjxcvY4tZyDkDxYya/QKplU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGqWx02p; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGqWx02p"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so350277eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782647006; x=1783251806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVxBwO9ofhwXsj5qcE/m/Bgq+dyvGwnXosapaOuR78s=;
        b=oGqWx02ptb+vosiIuY+goYbR/fkBHnGbCEW8aASZVXo0kw7YG1At87QkUGu2bjO5xL
         H0vZj4qoML43+u98TICvVUSRzEBGs8nDseGlW3YUR4GgBP5/r+w0p+VuLqJ0uMh4ahMN
         3ViBk48Gzk2o3lDg8dH44s8FDWR3TVsdNZUJJCk29aPnlJHlKf69ayiD6RWa+SLjUEGY
         4b5WHXguxRS5N+yIsuawjN9NQhzIfsS3J1SOe4DsjeYjceyM4XgG8FWzkk1W+jCdP7Qh
         joGjX7KxjHWYqX/XsN1moaV/rEJ4n8/O3kMV6lJM4MS6aQe3fHu3VO9l9BrDwaq6gO08
         wz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782647006; x=1783251806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVxBwO9ofhwXsj5qcE/m/Bgq+dyvGwnXosapaOuR78s=;
        b=P3wLImo3lwK6b2N6wNbmzb3PGHLQZ5BwobKHs8tgkOFZBAH76glcu6z2fN23EJvEQ1
         lgST6cq7NnYpb7KawkTiNLPmF98xtC1O/9qt9axfJrvfyWmOk1jV/Z2zseDMVR3PnTWG
         teXkiDC3LUrsx8s+jeaGMfEPCcc3BKYUb+T3lafZB4xM8FpD+ardIZTkL6JNUtJf/On+
         pMquZKP4SuKmabqurKgJif0nXwLBNp0j4l5vUlOZPztWQVTbqW93J0jngMoNQwT7osFJ
         l7TV6zFxV6HjnGAeoiNPs4wyinImckt9TzkDuR0X3aI3gb4moa30hm9/x8Fcug9xj5nJ
         gQnw==
X-Forwarded-Encrypted: i=1; AHgh+RrGZNwVSej1ZxZTDak1PlmwkmmnlAvAxtBI0OW3vt6myeKRORBx8LQtR5EYb0q6o6M3q2wdonf8fhvZ4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+va08tzvyhRE8q65Do9ImM2IQNtcMRyegZw8MEALpwVJt+0A
	xlPCzx/BrBxQE2jZJiPuTSe41ig4ASq8WGJ/KPg/ke11BUzGcOxKh83Z
X-Gm-Gg: AfdE7cnfuOMCr4Hu6l1tTU9/Z+eF0XBDVqCNwRACvHE15sx//fqwq5gbq/BDjABlMSs
	49E8+qFCFTnvnrfoHGSvZl9nRzEjzBJmR+pVlFW4dNAtCPzXRHmDkeFYZMYftHjiNzdczc7Edp+
	W76QEC1xKBBoomNXpdA9h4acADK4c7H5Y/KsD+1bQ/2C5Gh2lWzKPMQrZkPdEUx+PDmlncTB1M6
	6qfYXu7flUDbbNbtFFb6cIT1RRN5bkSD+BA1+b95+Iao6dSMmeKu1aLySTs1e3FhY0r4G9qPcli
	UcX9/n/rgoL8WC/RvI4HORqB+je8JAHjmegi/M6UyIMLJIbdtSXCSSp0UwjmH9QZVffd3ZnMPGM
	17ekaRiN+OwdzsKQoKne0k4gdItEJznmXMgfeDFlzrxE5ZMh/IhNSTbr9C19DYaC5acCbNoG25m
	wiqDJ2y42b+2cZYEHf3j10LOXA+qWE1lIfoRhyjyRuLIwIP5g40M4zqR8q2hUN5FWr6YefTyCTK
	c3+njMJGAAZ2P1AHT+b0kddrOPNV39dDJLn8cst5cqYQsMk4LJTUcnooQD4x32UOA==
X-Received: by 2002:a05:7300:a485:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-30c84d5034emr11553921eec.8.1782647005659;
        Sun, 28 Jun 2026 04:43:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:05 +1000
Subject: [PATCH v2 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-apple-audio-redux-v2-7-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=FKofmjv+HMrQuSW7ticy2BojcrI4dpO37WSVpG9Fvcc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHHs2zPshPdexky1RRnnzjANxF16Eyh9O8Z+T1+/lX
 z1RxKGvYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUGcxj+55rULluzUllXxTu2fv4Pp2OvfqtYZkl82lLp5584vfZWFyPDTqt+rbt
 2+9dfEFFRX/7va8+rhddYT0bFz63Y8nOHlm0mIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index a1da01b0be32..eaa4e81f9a3b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.54.0

