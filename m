Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54983F44DE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430396; cv=none; b=d3Dkf7cwIscOPcD56NqoUdPsxIDtlR42eO+VD83bCmA/iuaDClDzC1O3pSaaMA9NGxubRKYogTV0o7hMsg8TPEcwUbeYTNOxZn3OOabRQhBz70W24lTOPDy2+wl7QDSsyyv2teScSucItI0ZzTSnjpcEQ5Hr1lcA5UOYF14L+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430396; c=relaxed/simple;
	bh=aQCvUESn4kAbEvU8LeVEWg+T5bsymteY5idBB42Ei8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=snfOo/2SnE9aKQQPEazdHmrHj8h9fvAQBePN/0PpXLkWJeO6NeF+j4GoacsPFard4EvKcgjYEke540/KneRoBdfDireh+uJExdUI+AE+A3VP2tY5vhE277mqrK6nilYH6Mc4dJzq01IsOcfQ1E87WKMYuxOvcLSRZ2v9imE7Q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJkyy7dY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJkyy7dY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783430395; x=1814966395;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aQCvUESn4kAbEvU8LeVEWg+T5bsymteY5idBB42Ei8M=;
  b=JJkyy7dYkxXTy4z2rNaohf00JsgzoE30A9ovv10NDcMaaBHypnNcJFCu
   RcBLk4GXQjPLb3HNIi4R7PM/0kUttSzKEG85ESQt3iw26OGXr08ysQGQT
   9skEqS3ykXXKVd2cBr1nov1pnKj1ht1KmQFQDZTEiDD1uL/7JDzCR7e6x
   MZCgV7GY0E4VZSYbfRCpyE8ENz/EYInDOsTNct1r1yvyvp6nds5sb5/C1
   g376H6Sjm7GWqfPi/uuGbRG28aQCjiViN4f7LJ127WmeT6gy4H0qqkQJ8
   42XvVvmbsaJjvWRWFcZCXRMy5wmF4794i0uH+wsVmBM2gTibLa7tYveRc
   Q==;
X-CSE-ConnectionGUID: ECYv9DkySb+HL25NObcSLg==
X-CSE-MsgGUID: l38Zq2N0TIWqhF5aFiW6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="87992091"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87992091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:54 -0700
X-CSE-ConnectionGUID: PSh+FEqFQx62CWrW0ZpO7Q==
X-CSE-MsgGUID: STMxykkaSimJUc0HCdzxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277214584"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: reset spib_addr in stream cleanup
Date: Tue,  7 Jul 2026 21:19:43 +0800
Message-ID: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The spib_addr register indicates the current position in the buffer
being processed by the host software to the host DMA. It must be reset
before being disabled. Also, add the missing disable call in
hda_data_stream_cleanup().

Bard Liao (2):
  ASoC: SOF: Intel: reset spib_addr before disabling SPIB
  ASoC: SOF: Intel: Disable SPIB in both direction

 sound/soc/sof/intel/hda-stream.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.0

