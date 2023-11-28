Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqzJ1Uc+"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA31E10E7
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701180230; x=1732716230;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aCdRsF9wl2XV2ZphAfMjWpZj9WAkr2DKIlp1EXoHEGE=;
  b=eqzJ1Uc+Szo2tUOWa2xfAUMXnZCZNEMhcQNdR9oNPbpcVbMQ7ABcjAHC
   Jb07znQDnYaqAooyO/OE0szCoNlUdSmpzTb5p7WTLSEomCGnnRAToVRIE
   IMPEKA22OEodAEu19TY9tISo4j3W3/zc+cnS3Oxpmw//pqyfc4KVu4evO
   IdiZ33Y8+X1D0o0NoKmZJk2GNWR17vhQvs9zkhybEZEjUNUJmgj3AmqJM
   Ti7/S+qd3GDPhSGuRi6V1ZW6VZZm41hJizhaXneViitJTtLiG4VUe4hb5
   8suCkpI5U1tv4aNobvXy+HXY4BkqIy+Ycult22TgzybkyYajxW8HhA8UI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383313846"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="383313846"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 06:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="892081172"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="892081172"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 06:03:46 -0800
Date: Tue, 28 Nov 2023 16:03:18 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.de, 
    alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
    pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
    ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH v2] ASoC: hdac_hda: Conditionally register dais for HDMI
 and Analog
In-Reply-To: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2311281602230.14041@eliteleevi.tm.intel.com>
References: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

On Tue, 28 Nov 2023, Peter Ujfalusi wrote:

> The current driver is registering the same dais for each hdev found in the
> system which results duplicated widgets to be registered and the kernel
> log contains similar prints:
[...]
> Changes since v1:
> - Drop the patch for patch_hdmi to export a funtion to match the device
> - Use the struct hdac_hda_priv.need_display_power boolean as indication that the
>   device is a HDMI/DP audio codec

thanks, this works as well:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai

