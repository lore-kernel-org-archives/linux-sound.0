Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815477;
	b=pPuoFXLdJVOiw9i1y9X8o7kzpcOeS11VuYgv67pURlHN9C7Ap43V01JIvVR+EBeV/zd3
	 CSsLbEnIxqbl+36qiFhDtPVcaQk9BJtX7fpuKVdyWOcGzpu7IADfA/Sb++aiKDofaxecj
	 D83A+yGk2wqwDpUS351PFNHVveUafiv5dt4K4AJ2xeROLKsWD28Td9vZ5WYdjs4/qBWaj
	 Mj6r4jZNbAsG8M4hOkHW8UMOM6JQ5Gr1U3JeNsSaBxypE06B8FXKzZBjlyhfnP15xAt3K
	 mtv4QJvgRTn40RazeJlZlrwHYFpDnhs1Xa6eZi6VPwFLP+aNZRJzhAJAp9m9KDlreMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815477;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=GOzarUlcX+xCtU84uzjcGmdZAx9CbmswnXGjODWavFg=;
	b=GtKwN6nSj+pJ13tclhj7J5B0S1qqS48CaS8vb/KoUJ7DvdOx25pspR275+iPp+ar7mgH
	 M1VYU6btuDq3Fgr5uIRiFbTjw/jN4VD6DWJ8mAL4rVF95m+hEfRt6BPjHvGMmgcBTcFXY
	 LPXyT00L6FvCuspcSpZUJZVt7wpzhQkTOcXB38UsmUpjoPauvf6A9PJseA1m7qqMbwM5B
	 LlRCBf3r0HvNKEHH0Dkujv0Z5Wz2GLM3DaQzSQ52v5JYwv57TMYWI9gPEMvA45cQEfmAl
	 2g0mGwibsExpdFHZaFniA65pOQtbWkndA+etzF9YzZBb6YsaUd2hgt7Jt5Vz9yRXGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=J3zNNlih;
	arc=none smtp.remote-ip=156.224.81.230
Received: from mail-m81230.xmail.ntesmail.com (mail-m81230.xmail.ntesmail.com [156.224.81.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC26606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC26606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=J3zNNlih
Received: from Wangqianghua.localdomain (unknown [27.38.192.73])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54cfdeadc;
	Mon, 16 Nov 2026 15:51:04 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	pierre-louis.bossart@linux.intel.com,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH v2 0/1] ASoC: sn624x: add support for the SN6245 part ID
Date: Mon, 16 Nov 2026 15:51:00 +0800
Message-ID: <20261116075101.862234-1-qianghua.wang@senarytech.com>
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
X-HM-Tid: 0aa1e35692dd09d8kunm11184b4024d367
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDShhJVk8YHh5LTxhIGUpPH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKQklVTEhZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=J3zNNlihn8ptACnbFSY7LBQCIEa12f2LKN6NEHjq0zvcVBw67EDfClos+PiZIE5vMM3UPCM0UygaoBLFFiXqYCvyTDwqCl6r1fg6D1x3phVoyTg1epq0Ak89HIdRuMt3gT4gZSqNLx/HUH3c0JyZYy4vkl/XMMys8DHYgCGCNms=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=GOzarUlcX+xCtU84uzjcGmdZAx9CbmswnXGjODWavFg=;
	h=date:mime-version:subject:message-id:from;

Hi,

This series adds SoundWire / ACPI support for the Senary SN6245 part ID
(0x0496 / 0x6245), which is register-compatible with SN6244 for jack,
amp and DMIC. Without it, SOF reports "part id 0x6245 is not supported"
and Panther Lake machines such as the MECHREVO YAOSHI fall back to the
HDMI-only HDA machine driver.

Changes in v2:
- Encode SoundWire version 0x3 in the ARL, LNL and MTL _ADR values
  (0x0000300496624x01). Version 0 is not a wildcard in
  snd_soc_acpi_sdw_link_slaves_found(), so those entries never matched
  a SN624x codec. PTL was already link 3 / version 3; link 0 on MTL,
  ARL and LNL is unchanged.
- Correct the existing SN6242 and SN6244 ACPI match entries on ARL, LNL
  and MTL the same way.

This supersedes the v1 posted on 2026-11-10:
https://lore.kernel.org/linux-sound/20261110034736.742465-1-qianghua.wang@senarytech.com/

An earlier v2 was mistakenly sent as a reply in that thread; this mail
is a fresh submission as requested on the list.

Link: https://github.com/thesofproject/linux/issues/6012

Thanks,
Qianghua Wang

---
