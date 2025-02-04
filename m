Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA13597D
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639905; cv=none; b=sEELCNzXvgOXZ8mE/JJY4wmobVL6dAot7AbufrUxIeXQoLuW3yXko6TY3W4DAggDQ2V0CgTU9Sx+ewJA7k2TVRGMsyFQjqUjKFICFIZcwsNJbY4WkuOdkv7eusWVQMaEYA2MUX88NZfnRVtTliWN5GHmlGjXe20McipFYItlEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639905; c=relaxed/simple;
	bh=av5aklKv202Y8eu8QopliGOhbt4H+e3W0fkWcHCO4UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BfDhKx3WZgdv9UUMEBURHsKq2oITmZtIl0XdaBWP7SHLwOOm2sW2IwWL/YwUXybksFRGablcSX3ib7yAzwMV42q0F+j7YvfIsdje5DjpBfCABXdqwBguWI8F/bgVTGHYGOfyC0c1QKXdx43cFAEre9cvf7cRksAux9r90P/b4gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CebXYTDO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CebXYTDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639903; x=1770175903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=av5aklKv202Y8eu8QopliGOhbt4H+e3W0fkWcHCO4UI=;
  b=CebXYTDOfgt13Sr5uWcEfFvfxB+cPA0iMzbV5g6KjZU0F2puRrS7xep9
   0JkdDwhF1mhqbYNBq5XyFrUtNxsu2vbRdibTbbanEn/BrYngfNeo8WCEs
   eHqxAyAwyNfM5k97o/lC8MaAk2HssGh5ixs808nZuN/sqOvXynmAHoKar
   Ol9Sqi52jGdFDAjdGyctQdDSagOdX2oPrNkfKmiJVfh04JjMQVmKLC2+o
   31aIzyTKKbIOKqtIjx7SiEsLMkwjVI3Ke+4HczihegfG/VlOw8DsR+yG2
   HsE75KkW9bL3C+bu5fHyHkdwIwvvUN49o6mknu69ExpEQQvkfyLgY4av4
   g==;
X-CSE-ConnectionGUID: jgx1h71+Q8m1BhCPrPCuhg==
X-CSE-MsgGUID: /TcpF25ZT3m5DFfUb6RZDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39046961"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39046961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:43 -0800
X-CSE-ConnectionGUID: NavP+T9qShODhM7B95AFUw==
X-CSE-MsgGUID: flXQT19DQAW1jvcvNDxI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147672016"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-tgl/mtl-match: declare adr as ull
Date: Tue,  4 Feb 2025 11:31:32 +0800
Message-ID: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The adr is u64.

Bard Liao (2):
  ASoC: Intel: soc-acpi-intel-tgl-match: declare adr as ull
  ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull

 .../soc/intel/common/soc-acpi-intel-mtl-match.c  |  2 +-
 .../soc/intel/common/soc-acpi-intel-tgl-match.c  | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0

