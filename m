Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D59246A00;
	Wed, 15 Jan 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931885; cv=none; b=rCR/cyuGWQQ1sQgGsF5IE18jdwzDJzZVey/4LgLmlV4UxSKM3B6/l6eHsscJ20WTQdGR3Ex0XUP817C8ksq+qjmH7yQeH5Bx5Xlx2YVQwk5mWj/uO+H098aOURv7XdmrbVBGuCOniChD14laDwIQicELne6bNvU5svKaIw4LYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931885; c=relaxed/simple;
	bh=o8EycFp+w/e94Tnitu9HSd8poOseBHWseIM9nQQT+Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZPiltLytni0nCdnidqCpm/geEu8fG6PSKYjGk7P8fVfsQanC1/o4VnK4enxlpY+Y/cTVK9HuEJX2kV9r+xSvKI72lSmFQzEqVfmp/ugUzZtOOo/jnjMeU7CjtopvW9rOS0RMJZgRlmi25Fm6xqlZ1U3dNNhgy+UgDP560lWQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUWC2lL3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUWC2lL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736931883; x=1768467883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8EycFp+w/e94Tnitu9HSd8poOseBHWseIM9nQQT+Bg=;
  b=aUWC2lL3bP3tJTl4NJTF50rXBCb8oh/uBnLrsErncj68ReVg2GGDz6KN
   0RAHbgVit38t2BC6hHJnXgeSRaL7MVreTbBr/WRv4wRDPLcUO0wlrA9MY
   BdM1eY8rggfglX/VaSl8EwEM/QC/fa11Kr5lHx+sU3VotPx4kLObtbhIG
   txnO8Sf3/5NgS+LtISvoewHaXKNRcLTVE9A/v5te+vJHyHTwi1ltoPFo5
   KQbe4HX9/QDOM1KKUVyEgLqJh4tHRlNUSAoFcxff7+e5nyraWurGIvKSS
   uKyOb+oAcilnpEtxY/YME9GdCUho6+QB1H1eJ0vmaL3iVUmzXP+3tYEES
   w==;
X-CSE-ConnectionGUID: U5bcFM1HTzm1DPtBvH7ZhQ==
X-CSE-MsgGUID: uXX89Pf/Tb2FRXGlmNYF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47841289"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="47841289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 01:04:43 -0800
X-CSE-ConnectionGUID: +6YYQTSzRJSTQVi0BBXIdg==
X-CSE-MsgGUID: zobGJY0TSO2aO/SiWLhzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110205650"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2025 01:04:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXzKE-000PiB-20;
	Wed, 15 Jan 2025 09:04:34 +0000
Date: Wed, 15 Jan 2025 17:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Heng <zhangheng@kylinos.cn>, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: SOF: topology: Use krealloc_array() to replace
 krealloc()
Message-ID: <202501151630.VyzkV2xo-lkp@intel.com>
References: <20250114012853.877331-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114012853.877331-1-zhangheng@kylinos.cn>

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Heng/ASoC-SOF-topology-Use-krealloc_array-to-replace-krealloc/20250114-093022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250114012853.877331-1-zhangheng%40kylinos.cn
patch subject: [PATCH] ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250115/202501151630.VyzkV2xo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151630.VyzkV2xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151630.VyzkV2xo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from sound/soc/sof/topology.c:12:
   sound/soc/sof/topology.c: In function 'sof_widget_parse_tokens':
>> sound/soc/sof/topology.c:1277:59: warning: 'krealloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    1277 |                                                     sizeof(*new_tuples), num_tuples, GFP_KERNEL);
         |                                                           ^
   include/linux/alloc_tag.h:228:16: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:979:49: note: in expansion of macro 'alloc_hooks'
     979 | #define krealloc_array(...)                     alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   sound/soc/sof/topology.c:1276:38: note: in expansion of macro 'krealloc_array'
    1276 |                         new_tuples = krealloc_array(swidget->tuples,
         |                                      ^~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1277:59: note: earlier argument should specify number of elements, later size of each element
    1277 |                                                     sizeof(*new_tuples), num_tuples, GFP_KERNEL);
         |                                                           ^
   include/linux/alloc_tag.h:228:16: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:979:49: note: in expansion of macro 'alloc_hooks'
     979 | #define krealloc_array(...)                     alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   sound/soc/sof/topology.c:1276:38: note: in expansion of macro 'krealloc_array'
    1276 |                         new_tuples = krealloc_array(swidget->tuples,
         |                                      ^~~~~~~~~~~~~~
>> sound/soc/sof/topology.c:1277:59: warning: 'krealloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    1277 |                                                     sizeof(*new_tuples), num_tuples, GFP_KERNEL);
         |                                                           ^
   include/linux/alloc_tag.h:228:34: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:979:49: note: in expansion of macro 'alloc_hooks'
     979 | #define krealloc_array(...)                     alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   sound/soc/sof/topology.c:1276:38: note: in expansion of macro 'krealloc_array'
    1276 |                         new_tuples = krealloc_array(swidget->tuples,
         |                                      ^~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1277:59: note: earlier argument should specify number of elements, later size of each element
    1277 |                                                     sizeof(*new_tuples), num_tuples, GFP_KERNEL);
         |                                                           ^
   include/linux/alloc_tag.h:228:34: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:979:49: note: in expansion of macro 'alloc_hooks'
     979 | #define krealloc_array(...)                     alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   sound/soc/sof/topology.c:1276:38: note: in expansion of macro 'krealloc_array'
    1276 |                         new_tuples = krealloc_array(swidget->tuples,
         |                                      ^~~~~~~~~~~~~~


vim +1277 sound/soc/sof/topology.c

  1191	
  1192	static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_sof_widget *swidget,
  1193					   struct snd_soc_tplg_dapm_widget *tw,
  1194					   enum sof_tokens *object_token_list, int count)
  1195	{
  1196		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
  1197		const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
  1198		struct snd_soc_tplg_private *private = &tw->priv;
  1199		const struct sof_token_info *token_list;
  1200		int num_tuples = 0;
  1201		int ret, i;
  1202	
  1203		token_list = tplg_ops ? tplg_ops->token_list : NULL;
  1204		/* nothing to do if token_list is NULL */
  1205		if (!token_list)
  1206			return 0;
  1207	
  1208		if (count > 0 && !object_token_list) {
  1209			dev_err(scomp->dev, "No token list for widget %s\n", swidget->widget->name);
  1210			return -EINVAL;
  1211		}
  1212	
  1213		/* calculate max size of tuples array */
  1214		for (i = 0; i < count; i++)
  1215			num_tuples += token_list[object_token_list[i]].count;
  1216	
  1217		/* allocate memory for tuples array */
  1218		swidget->tuples = kcalloc(num_tuples, sizeof(*swidget->tuples), GFP_KERNEL);
  1219		if (!swidget->tuples)
  1220			return -ENOMEM;
  1221	
  1222		/* parse token list for widget */
  1223		for (i = 0; i < count; i++) {
  1224			int num_sets = 1;
  1225	
  1226			if (object_token_list[i] >= SOF_TOKEN_COUNT) {
  1227				dev_err(scomp->dev, "Invalid token id %d for widget %s\n",
  1228					object_token_list[i], swidget->widget->name);
  1229				ret = -EINVAL;
  1230				goto err;
  1231			}
  1232	
  1233			switch (object_token_list[i]) {
  1234			case SOF_COMP_EXT_TOKENS:
  1235				/* parse and save UUID in swidget */
  1236				ret = sof_parse_tokens(scomp, swidget,
  1237						       token_list[object_token_list[i]].tokens,
  1238						       token_list[object_token_list[i]].count,
  1239						       private->array, le32_to_cpu(private->size));
  1240				if (ret < 0) {
  1241					dev_err(scomp->dev, "Failed parsing %s for widget %s\n",
  1242						token_list[object_token_list[i]].name,
  1243						swidget->widget->name);
  1244					goto err;
  1245				}
  1246	
  1247				continue;
  1248			case SOF_IN_AUDIO_FORMAT_TOKENS:
  1249				num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_INPUT_AUDIO_FORMATS,
  1250							       swidget->tuples, swidget->num_tuples);
  1251				if (num_sets < 0) {
  1252					dev_err(sdev->dev, "Invalid input audio format count for %s\n",
  1253						swidget->widget->name);
  1254					ret = num_sets;
  1255					goto err;
  1256				}
  1257				break;
  1258			case SOF_OUT_AUDIO_FORMAT_TOKENS:
  1259				num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_OUTPUT_AUDIO_FORMATS,
  1260							       swidget->tuples, swidget->num_tuples);
  1261				if (num_sets < 0) {
  1262					dev_err(sdev->dev, "Invalid output audio format count for %s\n",
  1263						swidget->widget->name);
  1264					ret = num_sets;
  1265					goto err;
  1266				}
  1267				break;
  1268			default:
  1269				break;
  1270			}
  1271	
  1272			if (num_sets > 1) {
  1273				struct snd_sof_tuple *new_tuples;
  1274	
  1275				num_tuples += token_list[object_token_list[i]].count * (num_sets - 1);
  1276				new_tuples = krealloc_array(swidget->tuples,
> 1277							    sizeof(*new_tuples), num_tuples, GFP_KERNEL);
  1278				if (!new_tuples) {
  1279					ret = -ENOMEM;
  1280					goto err;
  1281				}
  1282	
  1283				swidget->tuples = new_tuples;
  1284			}
  1285	
  1286			/* copy one set of tuples per token ID into swidget->tuples */
  1287			ret = sof_copy_tuples(sdev, private->array, le32_to_cpu(private->size),
  1288					      object_token_list[i], num_sets, swidget->tuples,
  1289					      num_tuples, &swidget->num_tuples);
  1290			if (ret < 0) {
  1291				dev_err(scomp->dev, "Failed parsing %s for widget %s err: %d\n",
  1292					token_list[object_token_list[i]].name, swidget->widget->name, ret);
  1293				goto err;
  1294			}
  1295		}
  1296	
  1297		return 0;
  1298	err:
  1299		kfree(swidget->tuples);
  1300		return ret;
  1301	}
  1302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
