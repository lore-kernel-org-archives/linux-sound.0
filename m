Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF9370D49
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756832; cv=none; b=fbYHDmxsmGZDr+wPL+dceDLkwJIYxGXD3oJoA6ybiQ+ymP/GpehpWZmI2yEuUv1WoMT1APuvQHxiW9SxirRNMKzi3pH8j+Pc1wEtW4w3zAvFzMSYHVQEh4LLpcUK09TIta2mYJhuu4nMyk1Zyn0oA/qHwuMx3UbiNRv07qJgOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756832; c=relaxed/simple;
	bh=HcuxoODQkLAG6+IO7GBsJ2AnnmlrWzhvpuB0c6OY03k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/tWmL1seIu5+RSMn4z7RcD6VqqEbNTCwU385zGIbORC/VUpkAhdksCZOSNldtQT7e2oSOMyau2x+OrS8aaxsTvzmY+juwAYPK6Y/BxuqKV0wtPN6/42Azphcm3OfDZ5V6xwMOMzL2KV5VsYJ4HKW0Mx1CePg5DagdIUxSa/OLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azJKuxqt; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azJKuxqt"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2094713a12.1
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756831; x=1789361631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=azJKuxqtOOs9Dwx3lImkftTIhGPbajBppCRc879ANoJf1RSDN4XucLic2dYV2Mjfgx
         c73BCCUoEko1CjyR6vZd9ENgZpyN98ASfy3hgOoR41jh8znnt8fbwDhrGjFSzSTx6nvZ
         xnRjhM0Zz2GqYLPhTHWJu94iYaUw7zwrzAAkI+NPb8RPOmSwcVOxMRtVgTInBEhm6a7A
         CM3WD41D2lFsdJwl2Gf/19xsdd95IW3VNbqQNfiyBc1vzS8gkNgSxf+PamN1PEFcRF9y
         +3AEFZFs8E3LiGytcb6aD9mIjgPLiF8OMlZo/ilJmhqDP0uASqxEojotpDxUuQJMZ4/c
         5YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756831; x=1789361631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=jZ2oCJbGRxJuC6TC/FDMX3eZclp8bA5X1CnrXPHVLhmMMiQ/6bUfsTJ/YN8a22qINw
         JgvopAOpDJ+t+p93G4o8qTJaAaMSPTWLN4dwGsORGWT7iBCF4mfGBdvfYshXGH+3z/Vv
         TtJv8l/xfm2XaMPEELiOqCKM0CStNI89KNjgW6GuOhTsecbLTL6R54hGq0TbmW3gPMvO
         9tJZ0uHrSZ92z2w8wpg1keP7OD7lJn9KM6A1JZullbM3qIcYseYXfwQH68MWi85BmI57
         YiHvhhjz3DuN5Lxfnv44aLBOcWzYhDHAFkYeWzIFUDQ5CXsOgGaX1/vauLZpkfBCBfKS
         W4sA==
X-Forwarded-Encrypted: i=1; AKwUvBx/EIV/FkojPP9nOFT0rMBohomOL9y66dZzQC6N8c+DBMdvIzRTiA5OVQi50Qz92AG1a08qmjYsKjje8g==@vger.kernel.org
X-Gm-Message-State: AFuF++mTUQ94u1xmx89oM7PeHJOO6Bj13gq8td9etHH1S0ciEseqXLDc
	R0Lh2FVvuhKnX1N1qGHYrb/GCoI65kM3Lw6Q/lJgmwr/2exeq4QqPGEh
X-Gm-Gg: AYBFou3uYXZy9LCrEKrC8sZyNkV65u2BllWG82uJYwqQCaB9u9Kwex/ekfIvsHkKFvs
	KJdrj3i8I1cnuZPVmprSFKeJ7G8F9dZveKiLNCoVOFe2ZsBLns4zYWvRI7Op2z2DQlYB8sL/t/M
	WIJWabBeo2X8m3GIWoqzYOTjzG/dS0eFN8HLWK8yPxEX58W0EQNRjaHMSiCBdzEBXYUr2W0Nki7
	29EuUS4t6jLWwzVLldPG6cyreX7EIYJdJW65KVCA4mxVcX/T7prD+ASDrMI1wlSqtUKWC++7CdN
	dz4jZ8ivWdmetOpbuZGAaXWGVLK9zGKaOzHKZAPtj51xDt+U3pooqEzHXEQ6p/aJot5fhTWu65n
	ICuB7e9xuBcKI4BAD+3NrcXrNopUXltSzNoNfDPMiDiCoFgF+FN7SObLxkp0EllzcZPvyxFE+BO
	f6akCqKFvwzWj8/WxMn3S6TCZqPLfSTmmrks/3X+94Q8MhiZGzvWdJV9C1ZvebtR8VW51flZ56P
	m8lSLuyt1PBaw==
X-Received: by 2002:a05:6a21:680d:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3da3a22a052mr34116677637.25.1788756831031;
        Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 3/3] mfd: wm831x: Fix typo "convertor" in comment
Date: Mon,  7 Sep 2026 10:23:31 +0530
Message-ID: <20260907045331.16932-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
