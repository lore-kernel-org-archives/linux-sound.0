Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE042BEA7
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414504; cv=none; b=Vqs9lf0S2RaMbK+ofeSlMW+NNQ1Y0mxys2leaybhHVmI0GwNUcu6Kf4aUZjpNp0sWcdkMF7fsTFaUthcKK+LkIopnSATOsTbheGbtvGgShUOFsIEdsQA3xbmk/LExfqS2BjUha6r4PFBTrp+D7SuIDoK1BA2tbx0/rdH0+kho1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414504; c=relaxed/simple;
	bh=usu13PtzzHHrD2UIMboxKhty9IP29CgqxgDowDaP7j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLuNN3/iSeTKKkbBVSUjNUZ67XvcLKCKLhkdCEP+7prvxLPmeaZ+yS8GGnGHx4sseOW0xIeZSN0gYQ5mG+Ld0VM6zI9vV2pgP9mOibVXQMpQN66tDdVzz7Ei3K4WL+kfoIG2FcZ+rKmL7hUoV8qhKiuQOzdqrjC3Z82/1E3SlUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhpQofkQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhpQofkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785414503; x=1816950503;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=usu13PtzzHHrD2UIMboxKhty9IP29CgqxgDowDaP7j4=;
  b=AhpQofkQIYJIMWYeRTTKibFF+mqsE3SupTmaJ/lTiXzVnrZexbJTWV34
   Nft2AJCg9c0C2nhEtsrb+tB/nYcczz+fOg3NDzJ/gr7S8uvRRkS6zxDch
   3kBEH2B/5EJdLaQdrkGmARhshnLGpbFNPRl9HoZIa/J/fN/tklj/x0wxX
   RdAVWoMAAYVNRwdrhBrOB90I5Gkxsj0sYiy7JoRdPdJXd40qphk1ztcPK
   hA0oSkw5Dh7Bx1fttxZ4wYYeo+YswYNYG2Gmw+xWcahh+H6Vs/dZ+ND+5
   nVVHlO/drH7T2Olt1HfGELY6vATaC4PQ9bQqFX4zH82I1vd3zPug6zuN2
   g==;
X-CSE-ConnectionGUID: X97+h3auRvOJ33Su+t7L9w==
X-CSE-MsgGUID: HjLwCkEvTE2E6sRn3pK0IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85158386"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85158386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:22 -0700
X-CSE-ConnectionGUID: ZpwfKHr6TV+7HOC0l1dM9A==
X-CSE-MsgGUID: uio1a6XuSjO1IaQIMtxLSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="265340635"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: hda/mtl: Handle powered on DSP on boot 
Date: Thu, 30 Jul 2026 15:28:55 +0300
Message-ID: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

It is expected that the DSP is in power down state when the firmware boot
is attempted.
If the DSP for any reason was left powered up then the DSP boot will
fail since the ROM boot sequence might not be able to run.

Make sure that the DSP is off before proceeding to boot it up.

We have seen reports that for some undetermined reasons the DSP was on
during system boot and this caused firmware boot failure as the DSP
cannot be booted up - it was already in booted up state.

Regards,
Peter
--
Peter Ujfalusi (2):
  ASoC: SOF: Intel: hda: Power down DSP if it is left enabled in
    pre_fw_run()
  ASoC: SOF: Intel: mtl: Power down DSP if it is left enabled in
    pre_fw_run()

 sound/soc/sof/intel/hda.c | 14 ++++++++++++++
 sound/soc/sof/intel/mtl.c | 23 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.55.0

