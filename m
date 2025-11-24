Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CB38F49;
	Mon, 24 Nov 2025 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007522; cv=pass; b=uVqzyWruvMVSkwiw8o4g/Ro1jIPmcmVKJSsH7HSDoaN63AnMqRJ7EUexIzhIliHm6rNi6jas+mdA1pi9Sc6x8ptr0S1tIejHsLqDgnKcmnrzpKy/e29n56ypKRLYKgv0kkR9K3G6/1sidKSZDAGVt2tyTU7o9UAOzDxrtfYYnUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007522; c=relaxed/simple;
	bh=U5/e7P29lKlkUX4b8STHb32Dh50bg29aLAgjK7aYkI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxE90Mg9YaAV1ZjiaMx+GuatlGpi7SR+DURmIqSzRuaYZtRc4o5168dZfrHreynpXTWYBUz4yiAj3DbQemNNx4PhvZXtdghhtygfjwux7OKbQzjb5mdCDWn7NKoxC6KiyRl+QpJycjD5Y9WF+TBfbnTygo0jecBMijhhX0SrcaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=KfagkMXK; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="KfagkMXK"
ARC-Seal: i=1; a=rsa-sha256; t=1764007510; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KjMFyKvmkK69HLzryKcw1y694Ug6jRyZFHCirVhCwfeLcsmQIGFu7Vj7nKlxzOTRfrYuK5ykog7RYth/vfTApb+vRj++HEeXbjYHIz70NJgJ/Mo9exbeP3uz4tSeKwdbaRx373Akz0caBT3+Sd5PnU/vHJY3NY+53VpcEZrJ8y4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764007510; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pc8fYETImu86tY789NAksTljrtHo8+Ce0lBVCcBIvrI=; 
	b=SIg51MxwoVW0JxgVem/2DmgqiXe0gRaLD7UdHCtHRbzxzd68kPDGN9vC+1+eoUKhJjoOjvlGxEp3zVFVZWl/mFXOxpAjEuKLa2MT8CEuiyrpDZnP/EgBJw/p7WUdFDHpmhdBuGYGwL7GJRx9CAeKBiVyvm19YbmAKD8lD1JizvA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764007510;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Pc8fYETImu86tY789NAksTljrtHo8+Ce0lBVCcBIvrI=;
	b=KfagkMXKbS3cbB3Kruv++7p9ZQLOMJUJmHaHHuFP64i5yRO8u6ySnShtM150pioA
	ZHsyppwLE7ye1v5i7uwzfi0bvod6/EFR+kbQduhxL4bccBS/wdlTkVIsvB0JeKYOXJ8
	RROCANhJMuH3Oq54zyA40jJ0PicSk4lHl6Ur0Iw/29o4S/lnzkwkejKI+qiClu9zrp3
	2vNL9c+f81l3UKtfjyWQo/FVTSQefwzf9UB5jXBnHoY2nvLn/eF7ij55zvVmnTORknj
	rBYx1lfbDLstbG86yOvZXpcjBFKYx58M0DMF1eiMv1NSfHWZ/E3Rtply2sj4VZ+VegB
	Y0g2NPUkOg==
Received: by mx.zohomail.com with SMTPS id 1764007508413227.3001793402335;
	Mon, 24 Nov 2025 10:05:08 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v3 1/6] ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
Date: Tue, 25 Nov 2025 03:04:56 +0900
Message-ID: <20251124180501.2760421-2-me@harin.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124180501.2760421-1-me@harin.net>
References: <20251124180501.2760421-1-me@harin.net>
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

