Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B1369207
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805672; cv=none; b=rXwUsXwS1qQ5zIjU6BrbhilD8XXL8Or+WuatcN35YLfW0JvVcOxTnHf1GKTrp0TPQMIRzB1DZsQJWgfoKN8bpeCA77NkHnsTO2HlZFixcZkm3n2fBbxhsbz79v5+oYvM8FQonYx077PtPgG94XhiEwaOLgiWGP1zh1taE/3mI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805672; c=relaxed/simple;
	bh=LSS8xHXXjdgfnfg+IhB2Un7XBoJ2Glmk2j5+t+KJVsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyNIftEwWiSk7DPn1F5ezj3U3uzRoJecjwLhCDtl9A81ugYcMgz943siBBJmJjAM5TqDRL4T6rKUOdghaXPmAztzOQszESIiIB0ayY4lAdGmpBnVbMfwp7O+erXT6ohCaQFO0gEQd8kOIWqJsl6VnXT06RswP7i1Ea2ELg/HQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mxfHft1p; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mxfHft1p"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8845cb580bso838840666b.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805670; x=1771410470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyC/uhMpICBVlM72cJz0mCT/cxqElCQ77i9jCBuDxhs=;
        b=mxfHft1pnSCMmEnx2rfKkZ40Ou8M47QTSCxyLfIcL4hUMVv2JAF2682GzYJVf9A4Uo
         Nek9ydSK8QND0iK1OFc393Mfqh/m8PLRAXUl2XmG+TjNse0YY3/SwuVkKDBIG6ul00Tv
         zgN1hi+js9a1CZHHlfCQLfOjYSil11MImWjIZA6kaNcsge8A0ELdbSk6/hdf5xMQ0QsA
         Ia2PLyBfGgG4lr5KOigzalP4GSmS+fXE2QAVzRF2J9HaPYfEJrrZErdaheU/IbX76bAZ
         AeYjyfcrbv7flX+LsF95xJxS9gB2RQ5sy5VWRF8Re74coDVwRYbsLYonGHeYXF8JHwoq
         zfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805670; x=1771410470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyC/uhMpICBVlM72cJz0mCT/cxqElCQ77i9jCBuDxhs=;
        b=Dp74baSAjDBs6uDpqmWV87Hyj5Rz2GVxPfPwBoXigHUzgytSZ5JuZNdYQNKqSj5fEg
         ECGv+VSKL1pZw9SjnL+SBlrswFOuiRrGCGo5+K+rTc5QlnIUiqM/9tPYiVcwrqkNS6Fr
         DTKYi/XnSV7uDltK+cTTmI+hUsVoqBNXW7TYu/V3jBdLsQ0K/TeIStg2KId1frgZHQMm
         iWEzOHCVeMMkdrQ5jh5KLtIl0lWmuonrlIxcRBfXoQuF35zDhBdCzSl1cMs1sjexTtG/
         pYN74ogMOE01sNCK7PdKHzt/n9x2U9qY9PSMetNjfr7DL5e1mkIvPWSrlsahk/oM4ftJ
         3LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVenKCHsz3AfvfnY3aOCrSFihc/q8QJrFvtkqOcEVexF8qeZ42mmXwGtbQ4qEguU5gfLOBQ3bfYFbPBdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV9EjBqVwWygUrguv1v3Vc2HIC6Kx/pllG9VR8wEfvUVKYVS5
	QnHHaQ+VHA7IyCpzORfwwsOT6upD9mdn4tNb5HAWrQSefBPnZCdFeiptTVYqaJCMehI=
X-Gm-Gg: AZuq6aItF0jOIosEnszvVWOBHyif8llMDO+YzrgmHUuzM2eX9mxRJoWsUpTWN2A8OV4
	mmwqzJTAHegzdBoouc9IQGtG/Q6MVOWPETkdvjK4eFQ86qau4IED1t94rxRtPaIPJKk9NJf9pyb
	P3UdiNkkCMYkoLJSTubmC2C0O840Tnb+DfOZqMz0GpUoSU5Yh+zjwbdVwO2EnBu6+ihjR54EGL0
	I6pIJN3E/eJRPMJDx3G6fAcrFylKibDsN4jeTTBbiSgPmDXU+I4gssBDq7UUPGQKOSLuMJ/uCFL
	/a9GSJk6/lQlRT3+qKOqDcM3WmktHpi+eHGdMSmFRq9P0+QtPLC4mc/micfOrj1Eia6kOm2sM3k
	X9RyY39v8K7MYaOqKD3L41e1ZsXvbT5lqqAyFcZdwCZDFG8W/hQg15hnxVjD9d2MRrgGK0+igvk
	Prc3HREQEvsYt25BsepFXZtk6yZQG0cBHaFpYeFHHe8CcpWQTKzamnNXhGD8GtLI3J9ePkxbGDG
	lLT
X-Received: by 2002:a17:907:3e09:b0:b8e:5e2:79fc with SMTP id a640c23a62f3a-b8f6a99e36cmr109556966b.14.1770805669543;
        Wed, 11 Feb 2026 02:27:49 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:49 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:34 +0100
Subject: [PATCH 3/3] ASoC: codecs: aw88261: Add firmware-name support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-3-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=2022;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LSS8xHXXjdgfnfg+IhB2Un7XBoJ2Glmk2j5+t+KJVsY=;
 b=DO+9FE4+TyZEMocZyMhfmVlLC5hLI6z/jUitlHfPxB64stboPJ8HugEI1vT1cWUjHvlcbXygw
 et+wFv7LPYXAgfGsKcfhI5Fn+yz3zSOYr8U1/7PEbbh8/ZrtEekiK8t
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the aw88261_acf.bin file appears to be device-specific, add
firmware-name support so that devicetree users can point to a
device-specific path to not conflict with other devices that might also
ship a aw88261_acf.bin.

Read the "firmware-name" property if available, and otherwise fall back
to the generic name.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 43c03d3cb252..02f8c2bb2569 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1094,17 +1094,22 @@ static int aw88261_dev_init(struct aw88261 *aw88261, struct aw_container *aw_cfg
 static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 {
 	const struct firmware *cont = NULL;
+	const char *fw_name;
 	int ret;
 
 	aw88261->aw_pa->fw_status = AW88261_DEV_FW_FAILED;
 
-	ret = request_firmware(&cont, AW88261_ACF_FILE, aw88261->aw_pa->dev);
+	ret = device_property_read_string(aw88261->aw_pa->dev, "firmware-name", &fw_name);
+	if (ret)
+		fw_name = AW88261_ACF_FILE;
+
+	ret = request_firmware(&cont, fw_name, aw88261->aw_pa->dev);
 	if (ret)
 		return dev_err_probe(aw88261->aw_pa->dev, ret,
-					"load [%s] failed!", AW88261_ACF_FILE);
+					"load [%s] failed!", fw_name);
 
 	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
-			AW88261_ACF_FILE, cont ? cont->size : 0);
+			fw_name, cont ? cont->size : 0);
 
 	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
 	if (!aw88261->aw_cfg) {
@@ -1117,7 +1122,7 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 
 	ret = aw88395_dev_load_acf_check(aw88261->aw_pa, aw88261->aw_cfg);
 	if (ret) {
-		dev_err(aw88261->aw_pa->dev, "load [%s] failed !", AW88261_ACF_FILE);
+		dev_err(aw88261->aw_pa->dev, "load [%s] failed !", fw_name);
 		return ret;
 	}
 

-- 
2.53.0

