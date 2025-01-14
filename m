Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28541CA84;
	Tue, 14 Jan 2025 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845842; cv=none; b=UhWsGQEpFJYcDJnDIwI9lsIpcUBdemhdOYKNLqaS5Rgw62Y/SRMWeWf42H9NhdtvzIwJ83K0q+vZioOGn5Pr9NlRNi4qROLQhE1AkZywL2s/pGB9hHiKHh0+vM28KJzwv5hjwTsZja/eD1RbFJsdWoJoCnQun1J/aN1S/xMZaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845842; c=relaxed/simple;
	bh=KWR1i4NTTXotSiVPXRJjXMkD1sNo2WV+XgKVBQLu3mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHuify4Dye4uZqFHFnLkxiLYQz+v4EyHRpSClk4M9MWstrD9/JmV87UBK0WHl2WAT5NkmI10EnlXseY8mblDSuVmBUzpr5vU3bSO5LqjiDJkYRef9gzBWl9c6+RInwb9hp4LmRO+3KUctQJEkwf3kJDJUB1Imvz0cRiGAq0R594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ke6SM0YU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ke6SM0YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736845840; x=1768381840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KWR1i4NTTXotSiVPXRJjXMkD1sNo2WV+XgKVBQLu3mQ=;
  b=Ke6SM0YUtmRNVrHM3v4U/uA/S7UuIyg0w13xi15YyixnLBxBJ3Prq+54
   oUViWLHWvcbs1PGdrLNLosw0R/KIFBTc07SAG68iHReOpTdt6fOfjyLZG
   PwAICIIhnPomsaxWsJtXNhQtD8Mv2scNE0q+Qf3KPWYWVtUZKd7EwwmRy
   WoxkzGKZ/TazzsqgHZFS99T1mKV9ZIFs5as2jHxNURyM/U4XKYuHGRc1I
   rJWVRJoJlsDF29DKw9xGqzMKPA798vCopX5ZbvqNxSRzaU3emqKT6ZMLF
   ffFmFx4T3uKj91R+MpjIXAWMIWvBZ3ya2sc4wSI8Rk1OULihW5UBPScmf
   A==;
X-CSE-ConnectionGUID: sP4GudlyRXayr4Z45opC3Q==
X-CSE-MsgGUID: kUcraufnTgCTlmjfo/AcYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48540883"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48540883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 01:10:38 -0800
X-CSE-ConnectionGUID: PdmIumZiS9W+o8d+jtbXRw==
X-CSE-MsgGUID: DFjBuiTqSAm7ZBTfTTupAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104572870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jan 2025 01:10:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXcwS-000OJf-0i;
	Tue, 14 Jan 2025 09:10:32 +0000
Date: Tue, 14 Jan 2025 17:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
Message-ID: <202501141658.tM15P1iG-lkp@intel.com>
References: <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>

Hi jiebing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab]

url:    https://github.com/intel-lab-lkp/linux/commits/jiebing-chen-via-B4-Relay/ASoC-dt-bindings-Add-Amlogic-S4-audio/20250113-143911
base:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
patch link:    https://lore.kernel.org/r/20250113-audio_drvier-v1-2-8c14770f38a0%40amlogic.com
patch subject: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250114/202501141658.tM15P1iG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141658.tM15P1iG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141658.tM15P1iG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/meson/s4-tocodec-control.c: In function 'aml_tocodec_sel_set':
>> sound/soc/meson/s4-tocodec-control.c:151:15: warning: unused variable 'clk_name' [-Wunused-variable]
     151 |         char *clk_name;
         |               ^~~~~~~~


vim +/clk_name +151 sound/soc/meson/s4-tocodec-control.c

   137	
   138	static int aml_tocodec_sel_set(struct snd_soc_dapm_widget *w)
   139	{
   140		struct snd_soc_dai *be;
   141		struct axg_tdm_stream *stream;
   142		struct axg_tdm_iface *iface;
   143		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
   144		struct toacodec *priv = snd_soc_component_get_drvdata(component);
   145		unsigned int tdm_id = TDM_A_PAD;
   146		const char *dai_widget_name;
   147		struct snd_soc_dapm_path *p;
   148		unsigned int lane = 0;
   149		unsigned int val = 0;
   150		struct clk *sclk, *mclk;
 > 151		char *clk_name;
   152		int mclk_id, sclk_id;
   153	
   154		be = tocodec_tdm_get_ahead_be(w);
   155		if (!be) {
   156			dev_err(component->dev, "%s not find the be\n", __func__);
   157			return -EINVAL;
   158		}
   159		stream = snd_soc_dai_dma_data_get_playback(be);
   160		if (!stream) {
   161			dev_err(component->dev, "%s not find the stream\n", __func__);
   162			return -EINVAL;
   163		}
   164		/*we like to use dai id, but it is fixed val*/
   165		dai_widget_name = be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
   166		if (strstr(dai_widget_name, "TDM_A"))
   167			tdm_id = TDM_A_PAD;
   168		else if (strstr(dai_widget_name, "TDM_B"))
   169			tdm_id = TDM_B_PAD;
   170		else if (strstr(dai_widget_name, "TDM_C"))
   171			tdm_id = TDM_C_PAD;
   172		snd_soc_dapm_widget_for_each_source_path(w, p) {
   173			if (p->connect && p->name) {
   174				lane = aml_simple_strtoull(p->name);
   175				val = lane + tdm_id * S4_LANE_OFFSET;
   176				regmap_field_write(priv->field_dat_sel, val);
   177			}
   178		}
   179		iface = stream->iface;
   180		mclk = iface->mclk;
   181		sclk = iface->sclk;
   182		mclk_id = aml_get_clk_id(__clk_get_name(mclk));
   183		sclk_id = aml_get_clk_id(__clk_get_name(sclk));
   184		regmap_field_write(priv->field_mclk_sel, mclk_id);
   185		regmap_field_write(priv->field_bclk_sel, sclk_id);
   186		regmap_field_write(priv->field_lrclk_sel, sclk_id);
   187	
   188		return 0;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
