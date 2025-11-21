Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A852DC782;
	Fri, 21 Nov 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738566; cv=pass; b=otGL4h2wtiMQbVvAFGEfnOUI4v9ERKgFtxUaUFHW/2mrCCmGb7w4zrVpC1FuIjOqig1t+s544y/QRNFTi7biok0HeDimS5PSLHtvBk1iriXez5puge7zNrM5xtAjkiCqDPXlTWyQAu1vtSEx/dZuSBAtXkkqE9yELKzMG+tIfig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738566; c=relaxed/simple;
	bh=U5/e7P29lKlkUX4b8STHb32Dh50bg29aLAgjK7aYkI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQq3lQetMFLTwmlhd4Q0F+f56JaHgtSMRfZv5CGxY4XADN/xLj2tvF3SY4vjKJG99VgHbpV/vX2TW75yCE9W3qpv8Y+EZ8e7zfwQs3b9Ed5TmJ0lt1IFztclYFRPVCrdkirO6YDYSsBebebI5mxCaW2bkQdzGxvDKI8mJ6ee5kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=SNrJ92uN; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="SNrJ92uN"
ARC-Seal: i=1; a=rsa-sha256; t=1763738554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CzbHnnrU/zqMWEWrOjxYScYn3srJB126xs4N21jj5y3GPZs50QUhJ35/zOPAzAkQ++TAcLb63IkUYOQZWuY39TamTdOu0kIuIeTDILu3Y4dIGfOm5xc66iF8wDp3fAWjbSUt2e577MVi9YeIEUlmDXIzBXuLT5Bep77rPWEdJD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763738554; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pc8fYETImu86tY789NAksTljrtHo8+Ce0lBVCcBIvrI=; 
	b=WH7TajFgo+HfxEzH8IBSUeILtE77crLIVbIecR8lCVnL0/TuJVG4Bv6iHxPy6nwoWGOZE8yXE6ABrgNu2AogPT8dOYpCi1PZwdRrkX35D4z/EsWen+6i9g3z0dEsfsZx3lONUhAVNt/4q4D65muXCtP3mxbyBpQbynf8siMyvCQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763738553;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Pc8fYETImu86tY789NAksTljrtHo8+Ce0lBVCcBIvrI=;
	b=SNrJ92uNRPqGwHXVKGNN2SyOgUDisLgPcWxODZkIIqPDGcZPIpYaQZtn+lMNy1Sa
	S3PeL7PEwOIjHyurj9KGcUdZR350wMBju2Ycalgc8BLETLVMd0tx8Vdoj2hulxTg5BQ
	phGIh99vyqMSOuL1YIFi9NtpP42ZKMBa9HhCZtdgaI6hbxAc1oUcqJgfSJzY/fVV0qS
	0OMmTYK8+5oJ4fCNmf79kxBx6EoIg/QFa5WXjus5Qsam6+3/U9PFtlKVCcdsVcrb4MW
	K08AI+txWXlcHfq9GPwb5Uiseg+tvroYz/11jPLNehLrBD3a5tsXNwLY8EgEltQOzAl
	efLQ1C4TMg==
Received: by mx.zohomail.com with SMTPS id 1763738551668464.23801436422093;
	Fri, 21 Nov 2025 07:22:31 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 1/6] ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
Date: Sat, 22 Nov 2025 00:22:15 +0900
Message-ID: <20251121152221.1152523-2-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121152221.1152523-1-me@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a hw parameter to the daio_mgr_dao_init() function to provide
access to model-specific information. This is necessary for proper
configuration of S/PDIF and I2S output ports on different hardware
variants.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctdaio.c     | 2 +-
 sound/pci/ctxfi/cthardware.h | 2 +-
 sound/pci/ctxfi/cthw20k1.c   | 2 +-
 sound/pci/ctxfi/cthw20k2.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index c0c3f8ab8467..10d0a7088718 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -390,7 +390,7 @@ static int dao_rsc_init(struct dao *dao,
 	hw->daio_mgr_commit_write(hw, mgr->mgr.ctrl_blk);
 
 	conf = (desc->msr & 0x7) | (desc->passthru << 3);
-	hw->daio_mgr_dao_init(mgr->mgr.ctrl_blk,
+	hw->daio_mgr_dao_init(hw, mgr->mgr.ctrl_blk,
 			daio_device_index(dao->daio.type, hw), conf);
 	hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk,
 			daio_device_index(dao->daio.type, hw));
diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
index 2875cec83b8f..d29b4e5b3fcc 100644
--- a/sound/pci/ctxfi/cthardware.h
+++ b/sound/pci/ctxfi/cthardware.h
@@ -167,7 +167,7 @@ struct hw {
 	int (*daio_mgr_dsb_dai)(void *blk, unsigned int idx);
 	int (*daio_mgr_enb_dao)(void *blk, unsigned int idx);
 	int (*daio_mgr_dsb_dao)(void *blk, unsigned int idx);
-	int (*daio_mgr_dao_init)(void *blk, unsigned int idx,
+	int (*daio_mgr_dao_init)(struct hw *hw, void *blk, unsigned int idx,
 						unsigned int conf);
 	int (*daio_mgr_set_imaparc)(void *blk, unsigned int slot);
 	int (*daio_mgr_set_imapnxt)(void *blk, unsigned int next);
diff --git a/sound/pci/ctxfi/cthw20k1.c b/sound/pci/ctxfi/cthw20k1.c
index 42b90c9b2ee9..60cc1d14453a 100644
--- a/sound/pci/ctxfi/cthw20k1.c
+++ b/sound/pci/ctxfi/cthw20k1.c
@@ -1031,7 +1031,7 @@ static int daio_mgr_dsb_dao(void *blk, unsigned int idx)
 	return 0;
 }
 
-static int daio_mgr_dao_init(void *blk, unsigned int idx, unsigned int conf)
+static int daio_mgr_dao_init(struct hw *hw __maybe_unused, void *blk, unsigned int idx, unsigned int conf)
 {
 	struct daio_mgr_ctrl_blk *ctl = blk;
 
diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 55af8ef29838..1a085e7e5786 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -985,7 +985,7 @@ static int daio_mgr_dsb_dao(void *blk, unsigned int idx)
 	return 0;
 }
 
-static int daio_mgr_dao_init(void *blk, unsigned int idx, unsigned int conf)
+static int daio_mgr_dao_init(struct hw *hw __maybe_unused, void *blk, unsigned int idx, unsigned int conf)
 {
 	struct daio_mgr_ctrl_blk *ctl = blk;
 
-- 
2.52.0

