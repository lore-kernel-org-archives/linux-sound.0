Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5F5349C3
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917296; cv=none; b=dDoYLUD2Gb+U5ZL83aGH+g/UeTk8eY3NoAuuhwB6wFnSgSGvNC7BbH//uEtwjBD+pASb2KqkGKyfqjQpql85H+XnTXHZvj4VWlQA56R0G27H/7cFmNkPR0MwHbaOCcQndT8/BJ3bgl22Obiw9JQXOoZSPJRGSKGDbTeu0YRxGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917296; c=relaxed/simple;
	bh=J+0QPYCcRwTh4UYvHGaLsdQFGbhW1sqFMApyfCXwqb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlysRCA6oYV2JSz2RvGgYzTN6W2YnGQ8OEfgrIYG4VIYi0oOMYHWSg2w1u1gLPw9VLs4cZlzkpab/6/YDa2GZlEN4fLVXOsH+G7zBMWkl0zszbAIMmRcKDw6GSs3e0dHOUR5M5dO/XccpAtsmhKa6L3EK9rzjcM/fMfpIpodzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhG8nsVp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhG8nsVp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so29500365e9.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917293; x=1792522093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=KhG8nsVpmWfUbigfLYbVm3vtmrMEEDbcV/DmCzu76zREtAG/lTDgPO1m6u/f8w39Zb
         UmNz5QGMon+aiCJ999d/jLSlARBnvqdspjCf9wvkNXKU4lHpfYmtd3Zhs3tT25L9F9F2
         O1Ul51QjdDk3yoEMUeUR6MZKWm3eTzvnSRt2VEfbhOb+WeBJks0LSJQUEGBsqWZEUAuF
         JJxlVdeByXEi/wimwyNmboD5bq+fz92x4FoD9iR0UWlS/qqzEdaiVbk/s23RvKbZBnsC
         iDj0hbK8Tq4jVxrXAl+3n5vI5zNoILvQrUgNUrxoApXoRBz+ou13ImT1vgTKzHGuRxIo
         sF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917293; x=1792522093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=2icBdfROgXXlsLkPy2utl3dGc+wUz0ifqlbtA4dqQa93PREi0wTGzEuvx3617sRlOL
         VaW6BCYOawKF5H2w2QFQPCoDLs4kGNuqoSmm4OF/c3CzJJE77ehFHaucAoi7o70MUyJz
         pzErNwgQqW7zkMcLRzyHGHX7xCwwkKnvX9tWGEIVRxESDPqEcQLSfqNahGS/tBV54w6G
         G1I3sw5xs6O01drmLxbWo8i2WmtYykLPecPxwrDZbFgJC1AFJo3cWYbc5aFQisyQudZ4
         JM+YG/Lnf5SpZQVLFenpzq5DOr9195BzsqrV8Ak1B5tL2K8+E5iDW6sJjql1UizsicZR
         zKlQ==
X-Gm-Message-State: AFq9FYJLuzy+7W4rgm0F6SXeP4rnQ6mAuJfp4zGhmgHsSAa53rQ3f/VA
	BAVd0kqFsnkY2M0kBVSLzbVu7PjX+JiKOodq6rsUPQuvt2x8RAxipMLX
X-Gm-Gg: AYBFou2wplryEA9iR0/czd/AtJZhs2JwyTyHSAoEijnC9fYlPzkwJ6ogD5mfJ0i7p3/
	s3F1Os9Zx1fektHqIwJ0IgFdiZP5vPez6E8Q3OUi/D53k73x8DM8xv/WEJZDJnrwI8cKJmX9Fl3
	sMJHZLR8drOiArb3xGtHO65KQR7Z1/zO9R80lY+Cd0wHkMfbAevrRyF858oFOQ0oPFXWbpyulDZ
	xgmTtyJadc285f7QZdmCzwvvQLOSaJv7dv1h/hsFgenaWAvBidoaOgz6HPkD0J5+o3QzbR8/bf8
	ZFEhfpdQKyNZ22LdnJK5AAAXpz7Ymq5GOnKPkC3ue3hBCaxCXA7qZSaK9933P882VWyPMFnqPNY
	kgiLOpxy3LOrSV2RNYEkMKHRQaOE9peDS3OjPzhGChU6Q1NGcxTXIj7GVPrUpA98Q34o6Vyseh4
	nlZJ0j7cvPlFJInb1wgNd9ctpYxRYOxyx72cNV7pEuCL7u772pXC53iKhynG3frE/dgMMz4N0h1
	8LR8aR7UZcEiovjcmU=
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr256259815e9.22.1791917292758;
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm690557595e9.9.2026.10.13.11.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 21:47:51 +0300
Message-ID: <20261013184755.530392-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Resending since previous attempt seems to be malformed.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

