Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD13ED3BA
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566065; cv=none; b=JO1f8RHaCNBfG8HBOrnAAzd1VOOOebaUwsM2wjchRMLcHsCnf1mXI98U7IVTivv3acINkcgqIIHvhl0/ijXsSQp0i4YP/vDp4q8y246fQkYO1783srJpkCQ8Sy1UdyMxGfuvTdujeCc6nuMNLFq5bdkqrTYbi5zCNLbgcAK2NxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566065; c=relaxed/simple;
	bh=aX9sRzKX0wrrW156EZNW1QYanyvTQY92AmQhZohSR/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBelQWDEkmDcfFVDOvT8A16nuEeNN4QsVyInkffg6H5mSmHt1W3UISJhSGRQe3LBhUz4Dr2Mg9RpANDQzATjZEKJGP7aeSFBkrink5rmPkvqO4VUvCFh8SqdTZVMHbSdHQpDxttGSKViMsXJw0UnPn329UHtD8i53DQEeYCliSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv140DU6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv140DU6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848643382fcso3238812b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787566063; x=1788170863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I0etaik6WYExchhy19XEVUSW7e1ryrbbO6lOF0t7pQM=;
        b=Pv140DU6p19i/ksUVRkPlCR0rSj/eShxrAAR8e8iMUSegKoL7mbDjIA6/ZtaIgCBcj
         CznGc8PRDmVxvMjEBHWjI/irZNDNY3AmGCnMpwIwduG8QjowCOSMGhZEc7gbL2oFyYdY
         qoE545PVQuLaU36RlafXuLb/HjxwdtPYwyUvZcLrliy1GtRQQNL9UndSKE4qvgWjfwC0
         vMTzVexNnPEvrTYHp9nTX5XMnF1qjMRWLHP1DjGvYNMx9VjgNsoSjQ1p8Hxi9w7/BQXC
         0HDMJsC9Hi6fgWhBHCRGh0ExXhCtRBtO/ZTGBblqFH24auAIkr6Bkb/AGSbPuxVjjoMG
         6AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566063; x=1788170863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0etaik6WYExchhy19XEVUSW7e1ryrbbO6lOF0t7pQM=;
        b=MFmP/KZ18Vi/wjLFBb+gwWiZQv3pA565/zcdlS+tfhZnBA4dvlj1gu5XkW8YdF0Cuz
         9AN1ndPCVDVEFiMeiGjxtU0QMg55UW1dP6GOu/YyW9a8UCUTbL5VBp8AeLnDwRskSnR+
         4GgxBX912Sk3ZFil1+RZ60kkNMgg+gsL6qedFd5hrEwYmlGgsSIMRbyHc8n/xi5wbFxm
         XOqxA48YBuNsQZNplJgqr6y6hDDYgUd6b1vnfNVf8SxZnmzjChIq1tZolZMwhTPCtPtM
         C9qFsdVaLaB495tNZmGH+ZgKiXUAw/JYpMucrbGOK0CL3ATDnvimDhAXoTx3KQ8F7a+b
         iLrA==
X-Forwarded-Encrypted: i=1; AHgh+RqvKKmV7HTE6BX/dxhzu9jYemvbZFm15/IYi9Y5gknv8lKBjfy2B0JGL0cmp/0N772QfcpCKWcjSfBb+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l4CEffgIpip+MxaEgty1ephoayJecmNZVYJh+Zj2U8WO9DBkz5
	26HArCiO1Rp1aCG2nog1kICDON4vPpcdP+hW1hSabffymHKVvHTfnOwU
X-Gm-Gg: AR+sD10oVGkKNnkkARvceSHpnLbzTMJ9Wlr/0yfsDy/a10L9hM6MthDSYL1bqA54O3H
	OrIu4EL1KdJS+cSxZFgp+3eZCe/oMSP4d/PmmxK+JFgW5+iVvO/CJfdWXoDnnjqpUYWkvgP5Pm2
	GYZXtnK7zKivE1+b2x9i3G8Xq1jJdn+ZrrkxmCtyvvF/fbVgce9ztCoAzoIMi6DcJVBUPb8WWqK
	fmXdL5uDEkqbrZM5eanpnC1RmXIkMUKaInbTz+CEVcNNZZ0F9o0nH6q99PQzLXyWk3jdYxDTRWn
	1qXSYroLPsb+n0K9pv4eCTEvNwndxFotCFKwEs6lz0T/h4OwONPymMHgPaiHSw2JKGCpkPWMpYt
	IjAkzqGdzkHyaSDDRG5NGQzK7k268ut6WVfiUAgBtte8tBYqQ3KYKImU4XGuuMPvLSPrIBjoFKn
	dyxac4gVqbqYLLt3qCvWnePdnoIr95G5eFTUq4ja7rP1eo74GHt0mMA6Qvu6jYSGuIxv1Kg1j/G
	N/1h6G6p9GQITXPzbdqh52RIts3131uE6eYycdhI7Ma1rDp7cIzbmWeHhhBtsI/ABCLhOxW9S7U
	WMFX
X-Received: by 2002:a05:6a00:4f94:b0:84e:2f2e:8def with SMTP id d2e1a72fcca58-851f9aafc0emr39369376b3a.6.1787566063324;
        Mon, 24 Aug 2026 03:07:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eed8b22sm1777275b3a.4.2026.08.24.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:07:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	cassiogabrielcontato@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: aoa: i2sbus: Check IRQ before requesting it
Date: Mon, 24 Aug 2026 17:07:30 +0700
Message-ID: <20260824100730.31601-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
The return value was passed to request_irq() without checking for
failure.

Check the return value before passing it to request_irq().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/aoa/soundbus/i2sbus/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index 833c44c0a950..adf123dd79a2 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -240,6 +240,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	}
 	for (i = aoa_resource_i2smmio; i <= aoa_resource_rxdbdma; i++) {
 		int irq = irq_of_parse_and_map(np, i);
+		if (!irq)
+			goto err;
 		if (request_irq(irq, ints[i], 0, dev->rnames[i], dev))
 			goto err;
 		dev->interrupts[i] = irq;
-- 
2.43.0

