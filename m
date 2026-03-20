Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE91339B1
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773967548; cv=none; b=QQ8UvLSyfIXihYWYrSpMgEudsgC/tsohzq78T2aGD+1TcuL1kZ4siiAnKbx6XT4o50fxxJnHW8L4tywPQhdYWRt6yIPT8yOZ8e2A2nse6wW4xbcdb8jg+qtRl5tb1iYI0UFI22IrP75jITCkWqOiMM/CkgPcnsc2w25KlDOWWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773967548; c=relaxed/simple;
	bh=QSDTRs1KqmY/M96Ff3RItaHHljTqw4BBU4i/zZG61qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=izZ0BHDisjBT6XoM3Z1sL7e/dtgki0QTINbmVK0A14ZcdmcbVA4Z8tHByWk3yEq06tcjLaihb24NxjnEBYFqKJ9/9/Wf9d7y2cSl1Xm/9geCOwFh6KfDtR6/5KjasFEgJWN1BDilNxYNMDrhyBpFM7frU6UDtiarO2jFVYc2Vek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON9nET84; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON9nET84"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-126ea4b77adso1312512c88.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773967546; x=1774572346; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhilIFboGytXcOYanm9I2+CEFiDrroAYXZ+UTYaHPtw=;
        b=ON9nET842sc4kGg8BtPI1yjh4fTsiDLaXAPUAb5TyOoUcXW1jr1sxHqSd90e4JyOu9
         Cf7izKzdUBBIqU0Az3Xe2qxDhYlZzRcjIZGdrhNkeLiYbsvvj7VcFQdKDzupGM9HOXPf
         b3FboNXa54j+U5ei1zglOSwKOhCkJSAUqtAyCPPmZjZMCima+HR5JdKA+24e9zobZL9G
         QSbYG5dza357vXyHM8lZPcHWrU4xMEJYf683BmCMtPBODimcl0t4GZrgjyVe+kucYES+
         7dQ2F8aZo8Lq/iU8JvVjb7gio9e3/PkJASqW//0kzLg64a2oecBaiPCMqIlrS4UDXIIU
         vyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773967546; x=1774572346;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhilIFboGytXcOYanm9I2+CEFiDrroAYXZ+UTYaHPtw=;
        b=B4jz8ehR/hlXYUBUFOpJLgjwgN+ECHy7YWutra3MrN+x1LCY7BtPGniPIxUtmxytj3
         s5EGpFcRRBeMQB6xRBvhDb5DHFt+/hWG1jScfamDDPQRskO+kKmd6RaUw3YYlfe39j7D
         5KfDTG6fuuCzw+hnqxSH1WpILZbBpXv1p2JHlcd2f3Amd1HFbkRj/jMFNT9/GKYFD6Sx
         altWzxd0tsoAVMmtzi4nGP7Biq3QzBky5svk6uwg9uK0C6acNuFhxABpwrQmESukyhT6
         5uqNbV5SasgeX3umQ/vAmCQMj+TNhjpTqQckKKpoF+aIRHN57rqWu7GVxdeZZk6qFcrj
         HTcw==
X-Forwarded-Encrypted: i=1; AJvYcCVNR65hsajFgI9y442RhKS+Y6VsZDzlpn47ZuizrGgFhUEJlqXuiqRgVpxHz7Bjw6GAONllnfJlK4VSWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2kdNSE/qJPEtdhhqAZhNcFVlpjymDWt00kghwpTxq9Ajl4F0
	GMYS17O3uoh8Jx33gjNF8aNPnCOS4F53KqEDKv94nsCk1HPfjYnwqkun
X-Gm-Gg: ATEYQzy5b3Zdy+c4DaCz+3yK2x1D7HrowUn5Zy4893zSKyp6y91gwzVZkb9qsL1w5vR
	3emYefcXsjvahOcqCPnWB4RW1CDjxca7kxry94rEAUbzdYQsEmelguMTVuIGnnAVWmgzEgAUBak
	Gcll3RZdYqcakqC1wYKrvomim82wtmNnU8DVOwLd9jZPYm9hSKb65UPxf0TsKWH0hQl0V6ZgpXW
	mLWL6X5S0QLmK4u9eWvaCpjzVVXOAATKUxW6lpDlZJccIpQAJ7/1vVv9fNVMb3JsBb4hhsHgLyX
	SmLhtGwcMXhYr6JtehvcREsIkzZYxSav7yswYryz254F9q6szABoe635v/e0tuaAC0Y1Emoatxg
	Wn+rskw5zRXXMbroXoIu+EvjSS/PSJWKVDLMTEpa1SqzXun+HUMhzUJ0Dvh4ogMWcjs1b/VB5zl
	3CIygiNJmxzSE9GVsNOYErtr52EGA/UbJnmA6Oa5Ak810AJF7AMCJEWvn773FcXwXuJZ6hqPLHM
	pw=
X-Received: by 2002:a05:7022:ec17:b0:127:3f2a:af21 with SMTP id a92af1059eb24-12a726752cemr555995c88.15.1773967545629;
        Thu, 19 Mar 2026 17:45:45 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a736cf7e1sm616965c88.15.2026.03.19.17.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:45:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 19 Mar 2026 21:45:26 -0300
Subject: [PATCH] ASoC: SOF: topology: reject invalid vendor array size in
 token parser
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-sof-topology-array-size-fix-v1-1-f9191b16b1b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MzQpAUBBA4VfRrE1dhHgVWVwMpmQ0I/nJu7tZf
 mdxHjBSJoM6ekDpYGNZA5I4gn7260TIQzCkLi1cllRoMuIumywyXehV/YXGN+HIJ1LlnC+6LC+
 7HsJhUwr5vzft+34O1K4DbQAAAA==
X-Change-ID: 20260319-sof-topology-array-size-fix-e900a6b357bc
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=QSDTRs1KqmY/M96Ff3RItaHHljTqw4BBU4i/zZG61qc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl7ZmwpKFU/wFd8JMNzw+ortw/tsNr84951PTNPs+dH6
 u+6PFeZ3FHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATcZrP8D8oZs7kjoR76tU9
 Dm0bpp2SsZ84OfLwo37LQvGNC5s8Fl9g+F9anvaAg3OdUXDgXMuP16rlZ2QuzXpwZeFrrw5JzyS
 JEywA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

sof_parse_token_sets() accepts array->size values that can be invalid
for a vendor tuple array header. In particular, a zero size does not
advance the parser state and can lead to non-progress parsing on
malformed topology data.

Validate array->size against the minimum header size and reject values
smaller than sizeof(*array) before parsing. This preserves behavior for
valid topologies and hardens malformed-input handling.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 18e2401152c8..35200d801fb7 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -736,7 +736,7 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 		asize = le32_to_cpu(array->size);
 
 		/* validate asize */
-		if (asize < 0) { /* FIXME: A zero-size array makes no sense */
+		if (asize < sizeof(*array)) {
 			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
 				asize);
 			return -EINVAL;

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260319-sof-topology-array-size-fix-e900a6b357bc

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

