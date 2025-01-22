Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B67462;
	Wed, 22 Jan 2025 01:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737510194; cv=none; b=C4hRdvWOS7Glr1ZcFgOwFg0x1RT6OwbvjJs2EuBVHLjk9tHTRB/qQagiTpJ3Opok6zHDps28X6w3Q91I1rfZWwtaRR0jhhVYr0IxMxFzSKAepW3SqkaOvW5Le3Lf8SsoiHs/4PHQD9219hPr/HG0xyiX3FOe4J6NM/j5GHDpKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737510194; c=relaxed/simple;
	bh=7k3ZTgD5h3fEwvUZh/o0/8ZHxvbQMeUkkpSuyakPhog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YclPduK++qxtf1o/csqjYaAjDIS/eOccX71BvLswW2fNFRkVVwgHWegRrubEnyrfu1PcpXXSV0QlsC1lxhR+bVaer1LWfCr23t0dJV8WOamQXlvdXliZ1kclWUF6N5HY1YQBRs5qi50aVcGsNC6tKBvIlrpLocv8uCWuitxyMR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=lf+EaxS3; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="lf+EaxS3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Vwl2uYGvp5QZdSnOf1ykfMtFgEqvhbcRNiDuvEFvZsg=; b=lf+EaxS372nzr+3S
	VXYKH9tDTFtnC7SRNM1ihV5Z+81rLSvfkNNQjdR45MwNQrhiz+fCWAiunvKIgx1kpsOYGtI4qD3ei
	fP1axjY5IcmTxyslGKJo1McsQbsxalxeXVp5uNa4TpcAY5eQsdmAVITZ9bYkByhBN3vYTM/gA+ohT
	0uxW+8t0dDKoNSs6Qh7xcsfweNfKGLT7KqzB3HwpfGvxnuruc/wHYASJ92Ebu3yb7Heq5UhYP0ZX7
	Ki9btqSoLHy2t8VUBRzn68BvT2mS5E7dIPy8vXJjkZ+WMLTVJKBjtMBtDG3yQyuLrBKMoBvSmaPz+
	QWbEshF69Kjp9NDRmg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1taPlm-00BPCc-1O;
	Wed, 22 Jan 2025 01:43:02 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: lola: Remove unused lola_(save|restore)_mixer
Date: Wed, 22 Jan 2025 01:43:01 +0000
Message-ID: <20250122014301.447938-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

lola_restore_mixer() and lola_save_mixer() were added in 2011 by
commit d43f3010b8fa ("ALSA: Add the driver for Digigram Lola
PCI-e boards")
but have remain unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/pci/lola/lola.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/lola/lola.h b/sound/pci/lola/lola.h
index 0ff772cf66e6..25f72f9e3f9b 100644
--- a/sound/pci/lola/lola.h
+++ b/sound/pci/lola/lola.h
@@ -499,8 +499,6 @@ int lola_init_mixer_widget(struct lola *chip, int nid);
 void lola_free_mixer(struct lola *chip);
 int lola_create_mixer(struct lola *chip);
 int lola_setup_all_analog_gains(struct lola *chip, int dir, bool mute);
-void lola_save_mixer(struct lola *chip);
-void lola_restore_mixer(struct lola *chip);
 int lola_set_src_config(struct lola *chip, unsigned int src_mask, bool update);
 
 /* proc */
-- 
2.48.1

