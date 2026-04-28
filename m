Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8647B409;
	Tue, 28 Apr 2026 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401447; cv=none; b=RBRp/V+PkPYrCRaL48d8M5NOelyGdV250rekvYTAaOl/MJeRJWxndUbzUq5S2cSN1I2AcxAUuOHlHY/bEqUpNDhg1yvIyFqnkppkIYchFrzzSKqfM4i34UHZuC9Zf5pDJLE8TUzMLWGpV+bFtUNDa1MBONLjXhAnHMbhDYY+NQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401447; c=relaxed/simple;
	bh=oe+JzWznQ8YxK0Bhd9PnaDiidSO0CI0JI/0o3qeBvuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV/QpazBxRnu2pUQamVdcr1CNoyoicwxLRN3YhumeHInzy2yyV6wZ/TtoHVHaMXvSaZivzl9mfy/u9ZL4aSbI6J/AsA/Y5J0cpmc/8e0qjn/iBJ8tpplYhdFdQBNMNzz3Tzuli8nWV5Ld05jKQmPnjnHdiixMwO3VzFZgV6Gg/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4q44AY5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4q44AY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777401446; x=1808937446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oe+JzWznQ8YxK0Bhd9PnaDiidSO0CI0JI/0o3qeBvuE=;
  b=P4q44AY5i4EPRaooJAxuBejImKaEFhZ2H04THW9WMWC7sqPtVg8jWmhO
   cl171lR43MckJOC2veUKxnJGa5LhcO4TRcQFJaxdXzufZDNwPlR2MQccU
   /1dAiFAp9eUaMsPnpLiGxWJ8sFcngryD4CcdDlL57Hx/opZ9iddzBH27F
   9eqO1hHbQzpUi4Zs8idtMIxm+F9jVUgIZMruBMANTf2Ac6oU0SIUF1lBB
   90dQkYQZoemJGTZSkGnHVgHzcBz4Mtpr72NePjMOta0myiQ+o8XpY5Qjp
   ohOUGUYAjfPBLzKKAjNb02oEkegGyKnddu/+plRDYnfYW/7fVtXmScmTY
   w==;
X-CSE-ConnectionGUID: 8lzt+8o/TYSe0tHaWtpcUw==
X-CSE-MsgGUID: DHhtDjAkRpq5HimBUg5QMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95887600"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="95887600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 11:37:25 -0700
X-CSE-ConnectionGUID: oqKFp8xhQKeho0mVQgBhaw==
X-CSE-MsgGUID: 37AKqoRQQzOLAKzHtU9wQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="227520246"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 11:37:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHnJ9-00000000A8W-3PAT;
	Tue, 28 Apr 2026 18:37:19 +0000
Date: Wed, 29 Apr 2026 02:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: wangdich9700@163.com, perex@perex.cz, tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, kees@kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix missing error check for jack
 detection
Message-ID: <202604290213.cQAWGYOO-lkp@intel.com>
References: <20260427070739.133369-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070739.133369-1-wangdich9700@163.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.1-rc1 next-20260428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangdich9700-163-com/ALSA-hda-conexant-Fix-missing-error-check-for-jack-detection/20260427-223457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260427070739.133369-1-wangdich9700%40163.com
patch subject: [PATCH] ALSA: hda/conexant: Fix missing error check for jack detection
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604290213.cQAWGYOO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290213.cQAWGYOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290213.cQAWGYOO-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/hda/codecs/conexant.c: In function 'cx_probe':
>> sound/hda/codecs/conexant.c:1193:21: error: assignment to 'int' from 'struct hda_jack_callback *' makes integer from pointer without a cast [-Wint-conversion]
    1193 |                 err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
         |                     ^


vim +1193 sound/hda/codecs/conexant.c

  1174	
  1175	static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
  1176	{
  1177		struct conexant_spec *spec;
  1178		int err;
  1179	
  1180		codec_info(codec, "%s: BIOS auto-probing.\n", codec->core.chip_name);
  1181	
  1182		spec = kzalloc_obj(*spec);
  1183		if (!spec)
  1184			return -ENOMEM;
  1185		snd_hda_gen_spec_init(&spec->gen);
  1186		codec->spec = spec;
  1187	
  1188		/* init cx11880/sn6140 flag and reset headset_present_flag */
  1189		switch (codec->core.vendor_id) {
  1190		case 0x14f11f86:
  1191		case 0x14f11f87:
  1192			spec->is_cx11880_sn6140 = true;
> 1193			err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
  1194			if (err < 0)
  1195				goto error;
  1196			break;
  1197		}
  1198	
  1199		cx_auto_parse_eapd(codec);
  1200		spec->gen.own_eapd_ctl = 1;
  1201	
  1202		switch (codec->core.vendor_id) {
  1203		case 0x14f15045:
  1204			codec->single_adc_amp = 1;
  1205			spec->gen.mixer_nid = 0x17;
  1206			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1207			snd_hda_pick_fixup(codec, cxt5045_fixup_models,
  1208					   cxt5045_fixups, cxt_fixups);
  1209			break;
  1210		case 0x14f15047:
  1211			codec->pin_amp_workaround = 1;
  1212			spec->gen.mixer_nid = 0x19;
  1213			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1214			snd_hda_pick_fixup(codec, cxt5047_fixup_models,
  1215					   cxt5047_fixups, cxt_fixups);
  1216			break;
  1217		case 0x14f15051:
  1218			add_cx5051_fake_mutes(codec);
  1219			codec->pin_amp_workaround = 1;
  1220			snd_hda_pick_fixup(codec, cxt5051_fixup_models,
  1221					   cxt5051_fixups, cxt_fixups);
  1222			break;
  1223		case 0x14f15098:
  1224			codec->pin_amp_workaround = 1;
  1225			spec->gen.mixer_nid = 0x22;
  1226			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1227			snd_hda_pick_fixup(codec, cxt5066_fixup_models,
  1228					   cxt5066_fixups, cxt_fixups);
  1229			break;
  1230		case 0x14f150f2:
  1231			codec->power_save_node = 1;
  1232			fallthrough;
  1233		default:
  1234			codec->pin_amp_workaround = 1;
  1235			snd_hda_pick_fixup(codec, cxt5066_fixup_models,
  1236					   cxt5066_fixups, cxt_fixups);
  1237			break;
  1238		}
  1239	
  1240		if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
  1241			spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
  1242	
  1243		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
  1244	
  1245		err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
  1246					       spec->parse_flags);
  1247		if (err < 0)
  1248			goto error;
  1249	
  1250		err = cx_auto_parse_beep(codec);
  1251		if (err < 0)
  1252			goto error;
  1253	
  1254		err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
  1255		if (err < 0)
  1256			goto error;
  1257	
  1258		/* Some laptops with Conexant chips show stalls in S3 resume,
  1259		 * which falls into the single-cmd mode.
  1260		 * Better to make reset, then.
  1261		 */
  1262		if (!codec->bus->core.sync_write) {
  1263			codec_info(codec,
  1264				   "Enable sync_write for stable communication\n");
  1265			codec->bus->core.sync_write = 1;
  1266			codec->bus->allow_bus_reset = 1;
  1267		}
  1268	
  1269		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
  1270	
  1271		return 0;
  1272	
  1273	 error:
  1274		cx_remove(codec);
  1275		return err;
  1276	}
  1277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
