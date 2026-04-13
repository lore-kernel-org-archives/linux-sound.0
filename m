Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2317B3563C4
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060494; cv=none; b=avam98F2n7uY8G5b0WI1DYdOadESqV1pPeIP3i06Hh/lXFyV0vYnWbJx+8Wyxf4aL4WRiMNoRRpPLZWxzOkSAAddHdlAbzjtTxvBxP+KNxZE8vrvZIJwV9eCQ3AT4ylU4IEMl0MdchY2rXDPLAmBx7xxmyobNiXb95ym4jqVCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060494; c=relaxed/simple;
	bh=CAKmk6wJwoSAx2E1DAxr+jsUpQn8HL237XxobqCqcLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=csF6de/yaRaIZXIlVqDBWLkg2D8016ihVXmhKReYAOJHChoxYJJYSKNU6OtsX0+nAkuyq/NnwCg5gawSrC0Mj/P+EJjvVoHXKccAjf4rIlw6W+rTcibHdcamGiIFZRRkUOgCJxW7y+j0NKaO3PNyeg2fk8CG5JCLJcJ1EzRdmno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ8ATsbu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ8ATsbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776060492; x=1807596492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CAKmk6wJwoSAx2E1DAxr+jsUpQn8HL237XxobqCqcLw=;
  b=BJ8ATsbu5jaKnXLJGi0uCCfapV+mpV6QX8/d3q6JULyaEXmP59CTCRjw
   k2UtS4Ce38F9nXW0clL75r/Gc1tXn+aak78tp9oE/aqeXnXcdr00LpnMK
   owUiSzLVL2f+D7EPHuQrKEwutDVswpWrD1nXp5heAcPVlyYzDMxEmE0BT
   WfurAFMHZpcac3tLD+kjS4oWLit81eAdb5OFwdExZBm4lIV8oXElnGego
   2kP4N6ZkJ+YQ4dzDB/pq19P/syzw8MxEIk67m3Z2teEJTBl5DYZpC6Fcv
   3plUdNiXOx/8DUzcJg5nkOy1pRGQ2ELJ3bBS56fuXJwkKEwkMQmGvNiqz
   A==;
X-CSE-ConnectionGUID: vjGoKO8oQveu3eAbK5D2+A==
X-CSE-MsgGUID: 2vzCrsmBRYSuMSUmS7poaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64517599"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="64517599"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:11 -0700
X-CSE-ConnectionGUID: sY2v2UGmRdCxAFmqylXCXA==
X-CSE-MsgGUID: HLlLJtKRRrKV/Mnf4GmR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="231415209"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: NVL/NVL-S: add platform name
Date: Mon, 13 Apr 2026 14:07:58 +0800
Message-ID: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The platform name will be used in the topology name.

Bard Liao (2):
  ASoC: SOF: Intel: NVL: add platform name
  ASoC: SOF: Intel: NVL-S: add platform name

 sound/soc/sof/intel/nvl.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

