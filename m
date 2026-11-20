Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187390;
	b=bd1Mulj+B7n6sx0eWGfyn9zHJcPuM5ysGL/R9luBNgN0lNFCPqeLgZrcASAESWhHjwSL
	 6R3poiEYjNO4BV+GLcMq9DAqp7mfOpGhHEO/x8/ti892ZXqfjqwR8XKe9b///v7Z8x6ID
	 +lmAhFop5qoKaatBVwIk4Tvoerdjpgl5dQLJZ//Nlie2h3eh1UcRBVGb5914DQ5ulNgSx
	 5/sERCz5L64/s/hHYcy7jzFAEke1/EezMObzYpInhYdb1DHwuBObDqPxSoY2cXA79IL2Q
	 HcppakVOI37YGzNKdUWMMZb7N8OD1FMgdQYVRsgFi6I9mcUvU/jKtJ0MFx+6oEKh1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4G2Z8DgW236/CaJgcwcHKxgYe8wTC0fFKJwOCsguycM=;
	b=mO+lKANX3MIe9Oclb202cqmW9UdpGk9hYFxrqrXatprKF2ZiBt4JmBLHr/p0LWyzZe+4
	 nUB2eTEcymm2KUjhfr30bBhH9GvebrVW+W+Q8EKt1uYHlP9kEZW2k5aLHzB83bpLomqHG
	 s2mKXoGc8BaSnpqh5h1bWObScKUdx/syLf8WBsQZgDwfVwpI4DHfwiRC2+6U4oGMjFQ3r
	 /h/blA7LH97I5pxwcmNfHSvoRPpnVD/102+OwZf59SECI88i4xUs79SptNHOh2lBcISEC
	 HzhryQ4LSpQXNbNe421GWRKXcuTS0iCzijVeH0/dR92iMr+DoIgYM9BolzLpVKH8ofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1cZ8BAy;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A1606A32C
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 15:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1cZ8BAy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187390; x=1826723390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3uEq/yeA/wwdctuFS/86vAc6NcGb/c9yTvaj5wnmBoo=;
  b=D1cZ8BAyMDts7UO7BJmZIzjjz9nj8mA2lQdNUHntCeWZGMmOrgWZO2YR
   snArPOexS89qUm2LeiV69e3nzFeotxEGyx4EYqPbGjS7IDzHXM8zadBus
   6Ct9WCtU+/lBfAziQLLKOpwu5Zk7wH9nVLIWjSH9x6cHZ38Zabxazzhxj
   ucB0/mKnldBhD/yUUArA/ZjAoAHp1E5ptNlbkX93IrVVkGy3qpqTUtsvf
   Cz5MRtmBZ0C7A1rxe4wVA7+aqGm/llcQaZp6v+4wnnMff3FeH75EWp67G
   7EVneGCdpepsc9upUb4150vsqiCBJHdoSMr78tULQJ8bwBZcRNbYaTLwZ
   Q==;
X-CSE-ConnectionGUID: PJmts2LUR0enAc22kVz+5A==
X-CSE-MsgGUID: nGAPkxFdTYq++JD9SSGzfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3912143"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3912143"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:09:49 -0800
X-CSE-ConnectionGUID: XrUIkjlPTGKBYK1BaHkl3A==
X-CSE-MsgGUID: 2QrbhMYSTmW+l9FKasNX2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11072662"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:09:47 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	kai.vehmanen@linux.intel.com,
	Michal Grzelak <michal.grzelak@intel.com>
Subject: [PATCH v2 1/2] ALSA: hda: intel: Release i915 power also when delayed probe fails
Date: Fri, 20 Nov 2026 17:09:36 +0200
Message-ID: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
work") stopped freeing the card from azx_probe_work() when the delayed
probe fails, and only disconnects it, leaving the free to azx_remove().
This avoids the double free, but the resources that were released by
the card free via azx_free() are now kept until the PCI device is
unbound. In particular the display power reference stay held, blocking
runtime suspend for i915/xe.

Release the display power in the azx_probe_continue() work in all cases.
This power reference is only taken for the purpose of the display codec
probe. If the display codec probe was successful, it will have taken its
own reference. In case of systems with the HDA controller on GPU side
(hda->need_i915_power), functionality is same as before - we have to
keep power.

Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
Reported-by: Michal Grzelak <michal.grzelak@intel.com>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---

Notes for V2:
 - Reduced the scope of change based sashikobot comments. In this version,
   only drop the display power reference taken for probing and do the change
   in in probe_continue(). Leave all the rest to azx_remove().
 - Add a second patch to remove unused code left after commit fbaccb1b19c7

 sound/hda/controllers/intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 5a7dd69955d4..1f754f04eea8 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2452,6 +2452,9 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	}
 
 out_free:
+	if (!hda->need_i915_power)
+		display_power(chip, false);
+
 	if (err < 0) {
 		if (hda->vga_switcheroo_registered)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
@@ -2462,8 +2465,6 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 		return err;
 	}
 
-	if (!hda->need_i915_power)
-		display_power(chip, false);
 	complete_all(&hda->probe_wait);
 	to_hda_bus(bus)->bus_probing = 0;
 	hda->probe_retry = 0;

base-commit: 1afd6b7547b2ff0824e91fdf269bbd089f767a5d
-- 
2.43.0

