Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49882233B
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728010911; cv=none; b=Deq6iO7Ok1Tmc5PJVcL9TVnQ30UgwMo3tH5w+kSRwcs+ieGkP/JM0+EG/ArUjn6XUz5ElqfPjtanaRdMvSNljipGmRIcTgkygDkbq0zxjoWWR340XbYL0IPxLb/1KKqdJJgPhhdrX+JU2CyFj6lpOlOi0HfR8zDYlmgm4HTbvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728010911; c=relaxed/simple;
	bh=eBOGJOJF6J5/sDCe9uz38OGCK7CMVwEbiPEDiPpONXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m3u7L4thQL+Prs6a0Wg3rgMmr73Eco1H7hBo7YhN+F4jwn5amYuQP7Jtfv/fdl2YxvpYoULLbaW1u4bZwqoXE7xXHetpbUz3/o4u8L92jvGgsq2FiZNXqmjhKi0z6saFmFiq71whPEubV+zR9qQTOgRSOk4yRITEu9WiIhFjesg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7gW9ZGq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7gW9ZGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728010910; x=1759546910;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eBOGJOJF6J5/sDCe9uz38OGCK7CMVwEbiPEDiPpONXk=;
  b=U7gW9ZGqeDqC8yIX55Wejv1n6+a9H43Ak+ju8GjvClqSHn6UCa8hBHM/
   w8RRT5cUlKTlxAaJ2vv5ajfwRyZtLzDvjGgKAIC6R2bHceZp4+INY7rg2
   XWxcO1rpecPJMpPQimOTdoyp44OI85asn8oKr0DaU9z5dALLBCtzwckt8
   ng61pn+7f7k7FNtW76L/eGgv7C8id4Q5SyRaixMNKPIHr9oFboVuuQzkG
   jtgrrDQkAujerTxRy20LQ5U1ST8zN9l2NQ+frWadyiJW6oF/oQSTYcTjH
   mKdvwLZ1oBwEHKAGvFMwaWVpmzkDzt6shiiTcOfF3Rdv1aJaYhPbCci1G
   Q==;
X-CSE-ConnectionGUID: /ZnfkBUUS/WMGW+4Tq9R3A==
X-CSE-MsgGUID: mvy12XxOTmqBU2Q51Go0wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27376709"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27376709"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:49 -0700
X-CSE-ConnectionGUID: l823Q11oQj6EIVLPGoPyVw==
X-CSE-MsgGUID: V1Gdwl3oSOC1Sf3og9DvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74400709"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.16])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: sof_rt5682: add supports for new
Date: Fri,  4 Oct 2024 11:01:32 +0800
Message-ID: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add HDMI-In support for MTL and rt5682 support for PTL.

Balamurugan C (1):
  ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
    MTL.

Dharageswari R (1):
  ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682

 sound/soc/intel/boards/sof_rt5682.c               | 15 +++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c |  7 +++++++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 13 +++++++++++++
 3 files changed, 35 insertions(+)

-- 
2.43.0

