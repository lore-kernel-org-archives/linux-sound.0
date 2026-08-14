Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA739345EDF;
	Fri, 14 Aug 2026 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735085; cv=none; b=MPLyq79E54b/5F0sAho2XaYiYHQmqiyHnfGvX84Ktstbb9kSBm2XjxhRa8eknzv1afQHEC+7uxg24852x3iOZmZXg0sj/jGf47kYk9PnqvTMOz7h5XRfRmzY8tCH/0F0ojtYgEMo6HYlpXxbbj6Y0KcTZAl12SegzV5ooh5jN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735085; c=relaxed/simple;
	bh=KvgCBPaZUSxUuc62UyZ+DBnp15fbjpGI4D1lc9Nw2Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwqXUsUyHL3FSiEOPkEc32yIiy7ZRP9VpTrlbBXsKRWrGyq6hLsBaFQW+BOARsBJjAKfePizNh4nihNzLajr6C/kUgyybEEJmwsp2bCpKPH6prVqVHCv9lEsK/mB21ASk6/wYDXFxupaT9oSR1xan6aRBygzEBaXVpYrsMC1VGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiieTahT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiieTahT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786735080; x=1818271080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KvgCBPaZUSxUuc62UyZ+DBnp15fbjpGI4D1lc9Nw2Fw=;
  b=TiieTahTZREtPC5pkwzthWHMMz6syZQbfCSxZReigPZpxJ08sxS+ebgl
   uOsfGUZBAYXxbSTyj7xNZWpdz4j/SpC6L5OLoRdd4JFwj3xU/P/fda+TE
   O4p62x61L/unnyeWL4an3Bgem9Ccx+4Qa6k8GJamf6MzYvdxf1PZ8Yb8i
   yEe9mtelmujfUtZGDAI0pJpn6f/+kNRSV9amfp4IAFKvToNsFd4+5wOfU
   +L1Ji6Oj3mcgADG1vJglxC4MoMgLZGFCJvCcfWRKf7U+KqIyM5fmBdxnP
   afsTWyOUrBaZYc5org6inRXi3+oSWDnorVXb7sSWfjghXg5GhkIlurDcp
   A==;
X-CSE-ConnectionGUID: oLCB0bLUQ4OowrtMhP7Ijg==
X-CSE-MsgGUID: 3YWpC0iFS2amOnEQal7cYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87241403"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87241403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:17:57 -0700
X-CSE-ConnectionGUID: L3kzhTLLQyaxH7Nbnv5hVA==
X-CSE-MsgGUID: fFDJb9AzTKen1JBuxnjtrA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 12:17:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxPc-00000000Zus-2DMA;
	Fri, 14 Aug 2026 19:17:52 +0000
Date: Sat, 15 Aug 2026 03:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Brian van den Berg <faxuser@proton.me>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Brian van den Berg <faxuser@proton.me>
Subject: Re: [PATCH v1] ALSA: usb-audio: Add quirk for Logitech PRO X 2
 LIGHTSPEED
Message-ID: <202608150355.lzmkt8EL-lkp@intel.com>
References: <20260731023307.28510-1-faxuser@proton.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731023307.28510-1-faxuser@proton.me>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on e7ae89a0c97ce2b68b0983cd01eda67cf373517d]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-van-den-Berg/ALSA-usb-audio-Add-quirk-for-Logitech-PRO-X-2-LIGHTSPEED/20260815-015804
base:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
patch link:    https://lore.kernel.org/r/20260731023307.28510-1-faxuser%40proton.me
patch subject: [PATCH v1] ALSA: usb-audio: Add quirk for Logitech PRO X 2 LIGHTSPEED
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608150355.lzmkt8EL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150355.lzmkt8EL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150355.lzmkt8EL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/usb/quirks.c:2253:51: error: macro 'DEVICE_FLG' requires 3 arguments, but only 2 given
    2253 |                    QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
         |                                                   ^
   sound/usb/quirks.c:2152:9: note: macro 'DEVICE_FLG' defined here
    2152 | #define DEVICE_FLG(vid, pid, _flags) \
         |         ^~~~~~~~~~
>> sound/usb/quirks.c:2252:9: error: 'DEVICE_FLG' undeclared here (not in a function)
    2252 |         DEVICE_FLG(0x046d, 0x0af7 /* Logitech PRO X 2 LIGHTSPEED */
         |         ^~~~~~~~~~
   sound/usb/quirks.c:2252:9: note: 'DEVICE_FLG' is a function-like macro and might be used incorrectly


vim +/DEVICE_FLG +2253 sound/usb/quirks.c

  2187	
  2188	/*
  2189	 * Use as a last resort if using VENDOR_FLG() is prone to VID conflicts.
  2190	 *
  2191	 * Usage:
  2192	 *   // match vid, and "manufacturer"
  2193	 *   VENDOR_STRING_FLG(vid, "manufacturer", flags)
  2194	 *
  2195	 *   // match vid, and device must have no manufacturer string
  2196	 *   VENDOR_STRING_FLG(vid, "",             flags)
  2197	 */
  2198	#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
  2199		DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
  2200	
  2201	static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
  2202		/* Device and string descriptor matches */
  2203	
  2204		/* Device matches */
  2205		DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
  2206			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2207		DEVICE_FLG(0x001f, 0x0b23, /* AB17X USB Audio */
  2208			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2209		DEVICE_FLG(0x0020, 0x0b21, /* GHW-123P */
  2210			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2211		DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
  2212			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2213		DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
  2214			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2215		DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
  2216			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2217		DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
  2218			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY |
  2219			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2220		DEVICE_FLG(0x045e, 0x070f, /* MS LifeChat LX-3000 Headset */
  2221			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2222		DEVICE_FLG(0x046d, 0x0807, /* Logitech Webcam C500 */
  2223			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2224		DEVICE_FLG(0x046d, 0x0808, /* Logitech Webcam C600 */
  2225			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2226		DEVICE_FLG(0x046d, 0x0809,
  2227			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2228		DEVICE_FLG(0x046d, 0x0819, /* Logitech Webcam C210 */
  2229			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2230		DEVICE_FLG(0x046d, 0x081b, /* HD Webcam c310 */
  2231			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2232		DEVICE_FLG(0x046d, 0x081d, /* HD Webcam c510 */
  2233			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2234		DEVICE_FLG(0x046d, 0x0825, /* HD Webcam c270 */
  2235			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2236		DEVICE_FLG(0x046d, 0x0826, /* HD Webcam c525 */
  2237			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2238		DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
  2239			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2240		DEVICE_FLG(0x046d, 0x08ca, /* Logitech Quickcam Fusion */
  2241			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2242		DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
  2243			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR |
  2244			   QUIRK_FLAG_MIC_RES_384),
  2245		DEVICE_FLG(0x046d, 0x09a2, /* QuickCam Communicate Deluxe/S7500 */
  2246			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2247		DEVICE_FLG(0x046d, 0x09a4, /* Logitech QuickCam E 3500 */
  2248			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
  2249		DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
  2250			   QUIRK_FLAG_CTL_MSG_DELAY_1M |
  2251			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> 2252		DEVICE_FLG(0x046d, 0x0af7 /* Logitech PRO X 2 LIGHTSPEED */
> 2253			   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
  2254		DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
  2255			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2256		DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
  2257			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2258		DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
  2259			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2260		DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
  2261			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2262		DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
  2263			   QUIRK_FLAG_SKIP_CLOCK_SELECTOR | QUIRK_FLAG_CTL_MSG_DELAY_5M),
  2264		DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
  2265			   QUIRK_FLAG_IFACE_SKIP_CLOSE),
  2266		DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
  2267			   QUIRK_FLAG_SET_IFACE_FIRST),
  2268		DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
  2269			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2270		DEVICE_FLG(0x0572, 0x1b08, /* Conexant Systems (Rockwell), Inc. */
  2271			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2272		DEVICE_FLG(0x0572, 0x1b09, /* Conexant Systems (Rockwell), Inc. */
  2273			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2274		DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
  2275			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2276		DEVICE_FLG(0x05a7, 0x1020, /* Bose Companion 5 */
  2277			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2278		DEVICE_FLG(0x05e1, 0x0408, /* Syntek STK1160 */
  2279			   QUIRK_FLAG_ALIGN_TRANSFER),
  2280		DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
  2281			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2282		DEVICE_FLG(0x05fc, 0x0231, /* JBL Pebbles */
  2283			   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL |
  2284			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2285		DEVICE_FLG(0x0624, 0x3d3f, /* AB13X USB Audio */
  2286			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2287		DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
  2288			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2289			   QUIRK_FLAG_IFACE_DELAY),
  2290		DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
  2291			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2292			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2293		DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
  2294			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2295			   QUIRK_FLAG_IFACE_DELAY),
  2296		DEVICE_FLG(0x0644, 0x805f, /* TEAC Model 12 */
  2297			   QUIRK_FLAG_FORCE_IFACE_RESET),
  2298		DEVICE_FLG(0x0644, 0x806b, /* TEAC UD-701 */
  2299			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2300			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2301		DEVICE_FLG(0x0644, 0x807d, /* TEAC UD-507 */
  2302			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2303			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2304		DEVICE_FLG(0x0644, 0x806c, /* Esoteric XD */
  2305			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2306			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2307		DEVICE_FLG(0x0661, 0x0883, /* iBasso DC04 Ultra */
  2308			   QUIRK_FLAG_DSD_RAW),
  2309		DEVICE_FLG(0x0666, 0x0880, /* SPACETOUCH USB Audio */
  2310			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2311		DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
  2312			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2313		DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
  2314			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2315		DEVICE_FLG(0x0711, 0x5800, /* MCT Trigger 5 USB-to-HDMI */
  2316			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2317		DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
  2318			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2319		DEVICE_FLG(0x0763, 0x2030, /* M-Audio Fast Track C400 */
  2320			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2321		DEVICE_FLG(0x0763, 0x2031, /* M-Audio Fast Track C600 */
  2322			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2323		DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
  2324			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2325		DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
  2326			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2327		DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
  2328			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2329		DEVICE_FLG(0x0b05, 0x18a6, /* ASUSTek Computer, Inc. */
  2330			   QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2331		DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
  2332			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2333		DEVICE_FLG(0x0bda, 0x498a, /* Realtek Semiconductor Corp. */
  2334			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2335		DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
  2336			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2337		DEVICE_FLG(0x0c45, 0x636b, /* Microdia JP001 USB Camera */
  2338			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2339		DEVICE_FLG(0x0d8c, 0x000c, /* C-Media */
  2340			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2341		DEVICE_FLG(0x0d8c, 0x0012, /* C-Media */
  2342			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2343		DEVICE_FLG(0x0d8c, 0x0014, /* C-Media */
  2344			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2345		DEVICE_FLG(0x0e0b, 0xfa01, /* Feaulle Rainbow */
  2346			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2347		DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
  2348			   QUIRK_FLAG_FIXED_RATE),
  2349		DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
  2350			   QUIRK_FLAG_FIXED_RATE),
  2351		DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
  2352			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2353		DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
  2354			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2355		DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
  2356			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2357		DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
  2358			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE |
  2359			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2360		DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
  2361			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2362		DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
  2363			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2364		DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */
  2365			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2366		DEVICE_FLG(0x1397, 0x0508, /* Behringer UMC204HD */
  2367			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2368		DEVICE_FLG(0x1397, 0x0509, /* Behringer UMC404HD */
  2369			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2370		DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
  2371			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2372		DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
  2373			   0), /* Doesn't have the vendor quirk which would otherwise apply */
  2374		DEVICE_FLG(0x1532, 0x055e, /* Razer Nommo V2 X */
  2375			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2376		DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
  2377			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2378		DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
  2379			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2380		DEVICE_FLG(0x154e, 0x3005, /* Marantz HD-DAC1 */
  2381			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2382		DEVICE_FLG(0x154e, 0x3006, /* Marantz SA-14S1 */
  2383			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2384		DEVICE_FLG(0x154e, 0x300b, /* Marantz SA-KI RUBY / SA-12 */
  2385			   QUIRK_FLAG_DSD_RAW),
  2386		DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
  2387			   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
  2388		DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
  2389			   QUIRK_FLAG_TX_LENGTH | QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2390		DEVICE_FLG(0x16d0, 0x0ab1, /* PureAudio APA DAC */
  2391			   QUIRK_FLAG_DSD_RAW),
  2392		DEVICE_FLG(0x16d0, 0xeca1, /* PureAudio Lotus DAC5, DAC5 SE and DAC5 Pro */
  2393			   QUIRK_FLAG_DSD_RAW),
  2394		DEVICE_FLG(0x17aa, 0x1046, /* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
  2395			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2396		DEVICE_FLG(0x17aa, 0x104d, /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
  2397			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2398		DEVICE_FLG(0x17ef, 0x3083, /* Lenovo TBT3 dock */
  2399			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2400		DEVICE_FLG(0x1852, 0x5062, /* Luxman D-08u */
  2401			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2402		DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
  2403			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2404		DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
  2405			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2406		DEVICE_FLG(0x19f7, 0x0003, /* RODE NT-USB */
  2407			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2408		DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
  2409			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2410		DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
  2411			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2412		DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
  2413			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2414		DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
  2415			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2416		DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
  2417			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2418		DEVICE_FLG(0x2040, 0x7210, /* Hauppauge HVR-950Q */
  2419			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2420		DEVICE_FLG(0x2040, 0x7211, /* Hauppauge HVR-950Q-MXL */
  2421			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2422		DEVICE_FLG(0x2040, 0x7213, /* Hauppauge HVR-950Q */
  2423			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2424		DEVICE_FLG(0x2040, 0x7217, /* Hauppauge HVR-950Q */
  2425			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2426		DEVICE_FLG(0x2040, 0x721b, /* Hauppauge HVR-950Q */
  2427			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2428		DEVICE_FLG(0x2040, 0x721e, /* Hauppauge HVR-950Q */
  2429			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2430		DEVICE_FLG(0x2040, 0x721f, /* Hauppauge HVR-950Q */
  2431			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2432		DEVICE_FLG(0x2040, 0x7240, /* Hauppauge HVR-850 */
  2433			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2434		DEVICE_FLG(0x2040, 0x7260, /* Hauppauge HVR-950Q */
  2435			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2436		DEVICE_FLG(0x2040, 0x7270, /* Hauppauge HVR-950Q */
  2437			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2438		DEVICE_FLG(0x2040, 0x7280, /* Hauppauge HVR-950Q */
  2439			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2440		DEVICE_FLG(0x2040, 0x7281, /* Hauppauge HVR-950Q-MXL */
  2441			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2442		DEVICE_FLG(0x20b1, 0x2009, /* XMOS Ltd DIYINHK USB Audio 2.0 */
  2443			   QUIRK_FLAG_SKIP_IMPLICIT_FB | QUIRK_FLAG_DSD_RAW),
  2444		DEVICE_FLG(0x2040, 0x8200, /* Hauppauge Woodbury */
  2445			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2446		DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
  2447			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2448		DEVICE_FLG(0x21b4, 0x0230, /* Ayre QB-9 Twenty */
  2449			   QUIRK_FLAG_DSD_RAW),
  2450		DEVICE_FLG(0x21b4, 0x0232, /* Ayre QX-5 Twenty */
  2451			   QUIRK_FLAG_DSD_RAW),
  2452		DEVICE_FLG(0x2522, 0x0007, /* LH Labs Geek Out HD Audio 1V5 */
  2453			   QUIRK_FLAG_SET_IFACE_FIRST),
  2454		DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
  2455			   QUIRK_FLAG_DSD_RAW),
  2456		DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
  2457			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2458		DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
  2459			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2460		DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., Ltd. BE02T */
  2461			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2462		DEVICE_FLG(0x2b53, 0x0023, /* Fiero SC-01 (firmware v1.0.0 @ 48 kHz) */
  2463			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2464		DEVICE_FLG(0x2b53, 0x0024, /* Fiero SC-01 (firmware v1.0.0 @ 96 kHz) */
  2465			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2466		DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
  2467			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2468		DEVICE_FLG(0x2b73, 0x0047, /* AlphaTheta EUPHONIA */
  2469			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2470		DEVICE_FLG(0x2d95, 0x8011, /* VIVO USB-C HEADSET */
  2471			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2472		DEVICE_FLG(0x2d95, 0x8021, /* VIVO USB-C-XE710 HEADSET */
  2473			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2474		DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
  2475			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2476		DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
  2477			   QUIRK_FLAG_CTL_MSG_DELAY),
  2478		DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
  2479			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2480		DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
  2481			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2482		DEVICE_FLG(0x3255, 0x0000, /* Luxman D-10X */
  2483			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2484		DEVICE_FLG(0x3302, 0x17c2, /* TTGK Technology USB-C Audio */
  2485			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2486		DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
  2487			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2488		DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
  2489			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2490		DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
  2491			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2492		DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
  2493			   QUIRK_FLAG_ALIGN_TRANSFER),
  2494		DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
  2495			   QUIRK_FLAG_ALIGN_TRANSFER),
  2496		DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
  2497			   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
  2498	
  2499		/* Vendor and string descriptor matches */
  2500		VENDOR_STRING_FLG(0x1235, /* Conflict with Focusrite Novation */
  2501				  "MV-SILICON",
  2502				  0), /* Stop matching */
  2503	
  2504		/* Vendor matches */
  2505		VENDOR_FLG(0x045e, /* MS Lifecam */
  2506			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2507		VENDOR_FLG(0x046d, /* Logitech */
  2508			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2509		VENDOR_FLG(0x047f, /* Plantronics */
  2510			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY),
  2511		VENDOR_FLG(0x0644, /* TEAC Corp. */
  2512			   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
  2513		VENDOR_FLG(0x07fd, /* MOTU */
  2514			   QUIRK_FLAG_VALIDATE_RATES),
  2515		DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
  2516		DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
  2517		DEVICE_FLG(0x1235, 0x800c, 0), /* Focusrite Scarlett 18i20 1st Gen */
  2518		DEVICE_FLG(0x1235, 0x8016, 0), /* Focusrite Scarlett 2i2 1st Gen */
  2519		DEVICE_FLG(0x1235, 0x801c, 0), /* Focusrite Scarlett Solo 1st Gen */
  2520		VENDOR_FLG(0x1235, /* Focusrite Novation */
  2521			   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
  2522			   QUIRK_FLAG_SKIP_IFACE_SETUP),
  2523		VENDOR_FLG(0x1511, /* AURALiC */
  2524			   QUIRK_FLAG_DSD_RAW),
  2525		VENDOR_FLG(0x152a, /* Thesycon devices */
  2526			   QUIRK_FLAG_DSD_RAW),
  2527		VENDOR_FLG(0x18d1, /* iBasso devices */
  2528			   QUIRK_FLAG_DSD_RAW),
  2529		VENDOR_FLG(0x1de7, /* Phoenix Audio */
  2530			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2531		VENDOR_FLG(0x20b1, /* XMOS based devices */
  2532			   QUIRK_FLAG_DSD_RAW),
  2533		VENDOR_FLG(0x21ed, /* Accuphase Laboratory */
  2534			   QUIRK_FLAG_DSD_RAW),
  2535		VENDOR_FLG(0x22d9, /* Oppo */
  2536			   QUIRK_FLAG_DSD_RAW),
  2537		VENDOR_FLG(0x23ba, /* Playback Design */
  2538			   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY |
  2539			   QUIRK_FLAG_DSD_RAW),
  2540		VENDOR_FLG(0x25ce, /* Mytek devices */
  2541			   QUIRK_FLAG_DSD_RAW),
  2542		VENDOR_FLG(0x2622, /* IAG Limited devices */
  2543			   QUIRK_FLAG_DSD_RAW),
  2544		VENDOR_FLG(0x2772, /* Musical Fidelity devices */
  2545			   QUIRK_FLAG_DSD_RAW),
  2546		VENDOR_FLG(0x278b, /* Rotel? */
  2547			   QUIRK_FLAG_DSD_RAW),
  2548		VENDOR_FLG(0x292b, /* Gustard/Ess based devices */
  2549			   QUIRK_FLAG_DSD_RAW),
  2550		VENDOR_FLG(0x2972, /* FiiO devices */
  2551			   QUIRK_FLAG_DSD_RAW),
  2552		VENDOR_FLG(0x2ab6, /* T+A devices */
  2553			   QUIRK_FLAG_DSD_RAW),
  2554		VENDOR_FLG(0x2afd, /* McIntosh Laboratory, Inc. */
  2555			   QUIRK_FLAG_DSD_RAW),
  2556		VENDOR_FLG(0x2d87, /* Cayin device */
  2557			   QUIRK_FLAG_DSD_RAW),
  2558		VENDOR_FLG(0x2fc6, /* Comture-inc devices */
  2559			   QUIRK_FLAG_DSD_RAW),
  2560		VENDOR_FLG(0x3336, /* HEM devices */
  2561			   QUIRK_FLAG_DSD_RAW),
  2562		VENDOR_FLG(0x3353, /* Khadas devices */
  2563			   QUIRK_FLAG_DSD_RAW),
  2564		VENDOR_FLG(0x35f4, /* MSB Technology */
  2565			   QUIRK_FLAG_DSD_RAW),
  2566		VENDOR_FLG(0x3842, /* EVGA */
  2567			   QUIRK_FLAG_DSD_RAW),
  2568		VENDOR_FLG(0xc502, /* HiBy devices */
  2569			   QUIRK_FLAG_DSD_RAW),
  2570	
  2571		{} /* terminator */
  2572	};
  2573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
