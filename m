Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7091EF1E
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709931027; cv=none; b=fE1IIanwJj+gUg4WeSaLvaGftDSb8vFDDOVp+HiVC8N+S7/MgsdnZO42C4G3cOCvUKc9awpI5rMi5a0dsurGSwTKPGm+gs6Il4gKdyoGdn3w60V38Gzt0VE1afxHWzQSiEqf4VeKKG8dR6j/5rJpjozflR2LpA3YJ4eG3xQHJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709931027; c=relaxed/simple;
	bh=/6aj7VcRtFUpDLXzKCgtmCPxav1dB5NR+5i8og9hTsA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lNHjB6DVNnSfygxYPE5mFbgJmE4TuT2BxVGC5lW+enTiLWuWPkW9yxVUy/FSkC9Bt5SwlGx1KZFhBZVHqwA+oZ0/t5AnKEQuE26VgSwLUlewlcW3M82dG8yQn1zuKWUem66qSaUQQrPzWgBQ/NLxzJ9zFgomSmOjMuqMS4nk9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF4EmkLk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF4EmkLk"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5132181d54bso3478630e87.3
        for <linux-sound@vger.kernel.org>; Fri, 08 Mar 2024 12:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709931024; x=1710535824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J2cbf+OSAcCVNssarDAWNCy4JoQ138LzooY8lnkOCco=;
        b=HF4EmkLkDIr4wKb7wmbjiYehJfvel9kjP96+6917BnpsBaAb3DUHRSOvHYMyRjolF8
         AJycD+2cHwrgwQ5QIexRky5pVo1fsX+JffMWAz7xgYuF/GC6WP3qGslHv0c0dvHmLmZ6
         QDwBYvqD8P8bW/+tUScwf8+amE0w8wuNMH3YCopPn1jFmx7NI/miCReO80I7iFGgl718
         hImcy/B3UVmpH9wicKasuPHTciW/+e3Ndy3czLG2tyfn86VyFNFt7jU2NLh4BhneFLg6
         gxQZHaTDhiGByzR4w1ffxpOJaG5+GMlGBNT3WOq3dTQs4kK7oXMh+JdMxOhKFHrUSpIj
         4fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709931024; x=1710535824;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2cbf+OSAcCVNssarDAWNCy4JoQ138LzooY8lnkOCco=;
        b=KbyC/1fOfN1g8SisXT7tMltkEZiAIBCgiyj8NfRp522DLxgebv8MuMKhT28Fo4RTKX
         pU6Oyq/FFEZwLRQfCDZmX/g/p0ZutLLLfkbr0EMMR/MvT09D3QuFmEn2l3jvgxgMS9u4
         J1IXLKWYuLHOzzeD4nav2udxKG5Dhq3ctEF2eTJlgx6r6oAsH22Si5gb3mfnNxxB6Gga
         0ayW4o6Ttg1YqqUm/yjILlxmT8nO4frqfeQRDuQjssGCmNIZUne+3Z/x1uTJkoC5d2eR
         UdSUJ0qs0segqrq+upG5094lkI12zjeiEJJl+DP+egX+e0ZwsDCFaBontNoVp8qPTJ38
         +Dtg==
X-Gm-Message-State: AOJu0YynfYFjm7YAbPRNSibjJxcDSrRyytRnM4SzPIJkn/LK9eMd7qAc
	grY/lFLgczFhCWEvEqBxGj105a6XrY9wX0A3fzjqVmQfnxmE7rdZKQNdZ8IalVjvqRDvPOF1aqW
	QUmiozzCZx8jxNQ89fgvtXLD92n87Hcf0kADpXg==
X-Google-Smtp-Source: AGHT+IFro09L2Upl88adqPGAPJkLjG5+XgaojdM36Zpn7mgzBxECeXZNqH/VvChEtPVRvl+xJ2HK19d7oEJSWLmfV/Y=
X-Received: by 2002:ac2:4241:0:b0:513:4658:3aae with SMTP id
 m1-20020ac24241000000b0051346583aaemr115052lfl.8.1709931024036; Fri, 08 Mar
 2024 12:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: M Cooley <m.cooley.198@gmail.com>
Date: Fri, 8 Mar 2024 15:50:12 -0500
Message-ID: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
Subject: ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi, I apologize if this is not the correct format for this request,
but I am unsure what the protocol is for people unaffiliated with
kernel development teams submitting [PATCH]'s vs bugs / feature
requests. I am happy to resubmit as a properly formatted patch request
if it's preferred.

The ASUS M7600RE (Vivobook Pro 16X OLED) needs a quirk entry for the
internal microphone to function. I have made sure the BIOS is UTD
prior to testing, and with the newest kernel, the issue is still
present until this fix is applied, after which it works as expected.

Below is a patch for the quirks table addition that resolves the issue:

---
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index abb9589b8477..af90da8646ba 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
                        DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
                }
        },
+ {
+         .driver_data = &acp6x_card,
+         .matches = {
+                 DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+                 DMI_MATCH(DMI_PRODUCT_NAME, "M7600RE"),
+         }
+ },
        {
                .driver_data = &acp6x_card,
                .matches = {
---
