Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF13B38A0
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811028; cv=none; b=UHjIr5nFJsuOw6IlwY6NgMI0c3DCG+cI1DIcwCQZ4inYPalRzz/kG7T2hKWgvnogI8J/+CQkY5oZy53clNU2h+UHaTfUpOhcoMxRHRFvQpB0pw6S7Ocm7N226d8HqCe2IuqG3FTrfp1VuWmyWszXMhCcSgDPP4tPutH9muzdadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811028; c=relaxed/simple;
	bh=cBF/PgoBgDQMZImfi0PK9EOQ4KdCg26XWDCXf0kpwQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JCxllwUDpvOIGYfAV+BX3joDOA9BhtLNpld/XzD9Doiuz6IdOUl8nf7Yle+l6dHY/4/inpvrfqeaw03sWOfzk3rR4BqNYhVqn4wna9ajuj887ISDt29JagifFpMdfw0OuUuOpr0gpmawlPIlfyUntVeuhSieY24EfOsArSkjNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkaW/HJo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkaW/HJo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8025aecc40so148140a12.0
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811026; x=1778415826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYp4Og2+ktDZKSQruyvoX8pnwkOqiEAo3XA3+4ENvyA=;
        b=CkaW/HJotLWkqswrjvWgtIb4xBRf2R7ToB4aRhWcn2BQQNa+MptKVi5MGjp0UX29vx
         NooW2zcNIf59sogK6HTkgvhQvNihII3bJxcAFITWatnjXICq3bcEGKc3WEtxP81SGiBr
         2+lbaTrGGTnkNI2U2I5rA3ooiSq+uno7nOvCowdxEv2RIXKxPKjb2J4bbkLDiFJ7KOdW
         zvTYSl0mncCuR0Pvx1oUTuvI5NSleXAic4QWpggZhFS+9o+OmQUHJ9rzj6WPwsZ1mtb2
         EfArhbao128cf+kIb9K/BnYZse5snOP0dLDrqeKtVb0CAXDCoHqaBucwbyfO1TgKAbDY
         FUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811026; x=1778415826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYp4Og2+ktDZKSQruyvoX8pnwkOqiEAo3XA3+4ENvyA=;
        b=Qmialw9KoyEvHvKPDU74s7Lv/bk9084pYTYOimljfMPEbj9ukUGvyupH7XrpQhrzFM
         5rBi5NBar157WtiS7rVzrfhTEo+KGb0PuHdiaUjVLxNT9zx+njZ3mh5un9rZHQu9YFzQ
         yMSH8T9sN/QQvSLjOdYqlD6d77D6vD9V9OiGIJqCCAVXXkCU2hQ5r/XMMs9TfXAaY8/O
         rPcinSAKsSMBM6QgwC8kyYRdQz/fwPQDx3t3S61bnylhG9Sp08bL5X4qPoRzGGKDwsZK
         o0mZRYOe5RrFMhMfRBfoUAbllifgHHLIJzEBWTrSU3Y7/fz1aXk6txQzzYsNHf9JOyxN
         oUFA==
X-Gm-Message-State: AOJu0YwXhhAnN9OCqa4MNLdnZHqDzw9+rNu1bKrpARgMZSHkNktrwZ3S
	xRLlP8OSMCouJ1FkFC9nsK01fPNn9ipUsiFUi1AXXF5iJkt5n/qr+TG9
X-Gm-Gg: AeBDieuoPK//qFaSfzyMqmBENCg6VPyO4ZeMSBowjkQH78jk5Rtq31fnJoR8HYvAuQP
	Qes8wFjhA3FDWhWHve7DCc9Umbmr4ijj1DmlbLmGZMXAevl04gJydTym7QfWmVB17Nca9jNGpen
	4xHHtY5GLWqO7+xKYdyFc74t/ihVHjokP1HNg36yy5kXHH+/prXkjqO8vTo/8peUQGFbTE3ngRx
	+lwS+9tW75/ttK4ennMDGmZsmgBkTrYSge+iPRIf63aTwDJelIyzMrsEdDCDvoeDC1MFqSoYSze
	nw65cmtx/c46CawWOLybsLoLNG/usga1g72KU3ZVN3m/gLJuTJjb9ES0QcKPfJuy1hYXoFkS64R
	+JkFU+St9HBz2+oNsxGS2bqKrmnnYUnQTo6E/7MBKQnl0c9lAhcF74ulZb+EUSighVZ48vGhbzJ
	6WYtLynGEHj4SEGxwlVHZVEZ6LN9W9lDGp28RT+trnY1+PXLTwpkBWuHdskQ6vhmaGSislXnhXj
	ff2GlraWMDEUcB7yxZDtLy3SoVip/9RznmuOWGBQcJkRypDR5hlKCXWOuxoMGvUqkJ0PHZVlbtK
	kiTbI8w9qG4=
X-Received: by 2002:a05:6a20:3ca8:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3a3d20bcbc3mr12745793637.22.1777811026410;
        Sun, 03 May 2026 05:23:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/2] ASoC: tas27{64,70}: Fixes for hwmon temperature
 readout
Date: Sun, 03 May 2026 22:23:22 +1000
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADo+92kC/32NwQ6CMBBEf4Xs2TVtoVo9+R+GA9QFaqQ1XUQM4
 d8tePf4MvNmZmCKjhjO2QyRRscu+ARql4HtKt8SultiUEIdRKE0DhWr4zRh9+6Dx8ZNxNhYowt
 BRp60gGQ+I21BEq/lj/lV38kO69Ta6BwPIX6221Guvf8Po0SBJrcyrw2ZRheXtq/cY29DD+WyL
 F9PcILCyAAAAA==
X-Change-ID: 20260425-tas27xx-hwmon-fixes-fc8540e81950
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cBF/PgoBgDQMZImfi0PK9EOQ4KdCg26XWDCXf0kpwQE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7XxiecQLFfdNTzg352qrQLfoU9ddPYfuM4XddlZJY
 M2om5bWMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGqRZEaG2YfPR9ZVahobpdmetPt7oHXz3MYW9i6FlIDOP3WeUdXRjAw3tyqniTf
 J6/tOCTX/n7xbe/Iqs/lTFBz4py2e2H19ZRErAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series makes some fixes to the hwmon temperature reading
functionality added as part of [1].

- The arithmetic for TAS2770 was incorrect, leading to readings
  which deviated from the true value sampled by the ADC.
- TAS2764 was returning the cached value for each read after the
  first register sampling.
- Both chips were returning nonsense values before the ADC was
  fully powered up, causing issues with some monitoring software.

Regards,
James

[1]: https://lore.kernel.org/all/20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com/

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Drop applied commits
- Respect non-ENODATA error codes when checking for a fault condition
- Link to v1: https://patch.msgid.link/20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: James Calligeros <jcalligeros99@gmail.com>
To: Martin Povišer <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Calligeros (2):
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Deal with bogus initial temperature value

 sound/soc/codecs/tas2764.c | 35 +++++++++++++++++++------
 sound/soc/codecs/tas2770.c | 23 +++++++++++++++-
 2 files changed, 49 insertions(+), 9 deletions(-)
---
base-commit: 425b3a9530f53cfa5f156ab69228a5e0b8de1667
change-id: 20260425-tas27xx-hwmon-fixes-fc8540e81950

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

