Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527540E8E3;
	Tue, 30 Jun 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823718; cv=none; b=HrLMceVeN5c4cN/Y3p4RtQqcR4c9yVwfemnNFp8AqiDG7IB77uWuOwrA/0u8MGXSNtc271FKsJZC9UgO6mWnYSuj3bFrqe00P8+cVCQ/mDb0Ac67RHKjEgjhEOXGN0rlrnfhImbOt2ZPK9tCs2/KwHBdwY6ce53cBrZUNnQItvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823718; c=relaxed/simple;
	bh=GxmbrJ0PqYuqnBSUuSgcvdWmxqzfrNbZS/935D+1KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lqQnQXT6iYKuH7KlRNlo43YBCx3D0mFx3tWtoNlWSlTp8ugAYQHFmCIju+vXr4zKWCJLGrzljBQ3KEAGZ2JxXe//TnO5jOMuyseIrdCfjsWWOUxIcpLBCMJoENsnKfZxzFvojzEyYb5Pjb2+RExwh/26FQ27AR3KvYkjFGSPFoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbpIDbZD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbpIDbZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782823717; x=1814359717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GxmbrJ0PqYuqnBSUuSgcvdWmxqzfrNbZS/935D+1KVQ=;
  b=UbpIDbZDzgI/i/sQa9Jaus0EPgka+lwId/3wUp1fRtt/YGeam6J/Mxy3
   Sow7WfG58N6j1KRRePMOzVWQJgoVB58n7QhlEwzlwB8U58+E8ViIr4EV1
   1F2tHjIwQtUiLRhvcYqgbT69UInl+p+6Xt/au7mogLNMdkOLVo0y00IZv
   RhgeGHQCEPKUlWvg1awmITCXrqkZNRQJnRaZ6+K14HlTN2PkT95PI5Fk3
   gjIKimkb9px2M1eBvY001d67Rz/K9Amo3O35M8I5xFMKvtC8EvthS+SfJ
   HSak6s84RkdqqFBjE+QvRk3VLo8u9DSclxvXvAcI35EA46bRNTZ0WUeiD
   w==;
X-CSE-ConnectionGUID: gjejwnb4TNGP9jUhGsKoQA==
X-CSE-MsgGUID: H5YmiI1LQvGa0DtP0s5QCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86084946"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86084946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:36 -0700
X-CSE-ConnectionGUID: HnLsjyBvSSS+AaP9cqvKmA==
X-CSE-MsgGUID: Y5nDMRiZRE+nkP4CF2qFpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290382837"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:48:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/5] soundwire: add BRA properties
Date: Tue, 30 Jun 2026 20:48:20 +0800
Message-ID: <20260630124825.2263243-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds mipi-sdw-bra-mode-max-data-per-frame and
mipi-sdw-bra-mode-block-alignment properties support and fixes the
BRA_NumBytes[8] support in cadence_master driver.

Bard Liao (4):
  soundwire: cadence_master: add BRA_NumBytes[8] support
  soundwire: intel: handle Peripheral bra_block_alignment
  soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
  soundwire: intel_ace2x: handle the max_data_per_frame property

Richard Fitzgerald (1):
  soundwire: Add bra_block_alignment property support

 drivers/soundwire/cadence_master.c | 35 +++++++++++++++++++++++++-----
 drivers/soundwire/cadence_master.h |  1 +
 drivers/soundwire/intel_ace2x.c    | 20 +++++++++++++++--
 drivers/soundwire/mipi_disco.c     |  6 +++++
 include/linux/soundwire/sdw.h      | 14 ++++++++++++
 5 files changed, 68 insertions(+), 8 deletions(-)

-- 
2.43.0

