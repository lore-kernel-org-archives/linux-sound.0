Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49424DCF9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047768; cv=none; b=IX09vuaGJBFdjAbZ6/20YAZpsxiDp3MA28xtvCkqwpBgNFnntDIW19GhV4T4MLVJmOE5kCCXDmaSfUTtM4i7qPb4wHbW4VD2t5Zpy8BhXiTE3kbqBqi7E16cbJBeD+rNk6uUxe6ewW0mlykNV10MGzW6p7SXTfNX5Nt5aC0eLLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047768; c=relaxed/simple;
	bh=9ikCxfRIcl4vjNTX3L5gAgmeFC7symXRbKBW4KGuUQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHf6y+E1exHytjVe3RQZYPel+LggU2PmLsb0y4QfxJe3rDZEDR1cb/BBD5osyXPepHxQ9Q1WfmSrJcQ0jX8dTPHn85AkKKVtpvvL13Q9N0NyEqW/h9gKMtp/ZEJZ/jB4gfZ9rODRn8Dr+LsuKMsPoZG1sADyqGyCgTOXfl+N/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebmTYi+r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebmTYi+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047767; x=1804583767;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9ikCxfRIcl4vjNTX3L5gAgmeFC7symXRbKBW4KGuUQE=;
  b=ebmTYi+rNcmDECS+epV85AM7UA3m8im9y/w9jQ8J3YuH9JrH6Pd+YP0o
   jRpwIuepzZOxEMy56Tk+n+rGXQBCJ9qSliOiJmGXEeX6BoUa8bMcsmN5z
   fjcN8qbMA/xpLEGpeJ9XXHbh1ncxzMP1+0Gat6Ja5U9hWdtS1f3PfyclO
   PVGDRgi2NuY5ygYiRFwW8d2uNpKrWxGmPAaVHyQYonCOztLcdfT6+X6uu
   zbXosQ4GxW9z1RUP8ao8tc4c4K4bALq9aZBCRmz7NCBIfqZWpmIGeRi2e
   mshyYwi7uetVy1aOIWqddoj1CKaXcJ9tJcW0FGAgOnxkcj1Qxid+NTSfS
   g==;
X-CSE-ConnectionGUID: HF9RDnMCTni1duxZsdtROw==
X-CSE-MsgGUID: FnoL2oqkQ+eCI85XJZXQsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84776969"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84776969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:06 -0700
X-CSE-ConnectionGUID: Qc5Tl++9SHGjR8FtfFFciw==
X-CSE-MsgGUID: N9KIDwXvRVCaXwHpcc79Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688611"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/5] ASoC: Intel: catpt: Overhaul volume and mute control operations
Date: Mon,  9 Mar 2026 10:16:00 +0100
Message-Id: <20260309091605.896307-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short summary first, longer description later:

- fix the return code for kctl->put() - currently the driver returns
  '0' even if changes were done
- lower power consumption for kctl operations by waking the DSP only
  when some streaming is done.  No streaming? Cache the values and
  inform the AudioDSP firmware later.
- drop the existing code duplication between individual and master
  volume controls

The very first patch addresses synchronization problem that exists when
an individual control and its paired stream are manipulated by a user
simultaneously.  As the refactor integrates the fix in its new code,
most of it gets shuffled but in case of a "refactor problem" I've
decided to have it separated and leading the series.  This way the
problem is fixed even if refactor, for whatever reason, would be
reverted.

--
More of in-depth explanation for the refactor, taken from commit 2:

The catpt-driver's volume and mute control operations always return '0'
regardless if a change occurred or not.  To conform to ALSA's interface,
value '1' shall be returned when a change occurred.

The second major point is power consumption.  Existing control
operations always wake the DSP even if no streams are running.  In such
case waking the DSP just for the sake of updating the volume (or mute)
settings on the firmware side is a waste of power.  The provided
implementation caches the values and updates the settings only when
streams are being opened for streaming or are already running.

As changing existing code is non-trivial, provide new operations
instead.  The put() operation, which interests us the most, takes the
following shape:

	// two values provided to put():
	// @pin_id - which stream given control relates to
	// @value_to_apply - the value from user

	if (control->existing_val == value_to_apply)
		return 0;

	runtime_stream = get_running_stream(pin_id);
	if (runtime_stream != NULL) {
		ret = send_ipc();
		if (ret)
			return ret;
	}

	control->existing_val = value_to_apply;
	return 1;

Adheres to ALSA's expectation and avoids sending IPCs if there is no
change to be made.

Cezary Rojewski (5):
  ASoC: Intel: catpt: Synchronize stream access
  ASoC: Intel: catpt: New volume and mute control operations
  ASoC: Intel: catpt: Simplify procedure of applying user settings
  ASoC: Intel: catpt: Do not wake DSP just for volume setup
  ASoC: Intel: catpt: Migrate to the new control operations

 sound/soc/intel/catpt/core.h     |   2 +-
 sound/soc/intel/catpt/device.c   |   2 +-
 sound/soc/intel/catpt/ipc.c      |   3 +
 sound/soc/intel/catpt/loader.c   |   2 +
 sound/soc/intel/catpt/messages.h |   3 +
 sound/soc/intel/catpt/pcm.c      | 394 +++++++++++++------------------
 6 files changed, 174 insertions(+), 232 deletions(-)

-- 
2.34.1

