Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89593BB68F
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390410; cv=none; b=vEcJuHzEY46l3+OpXX0OYZ+3uMqvMRQe9cjIjT4Iu2+VAVZD/CeFxQHGP5E+IwupwPVZ6OUdlKiJwQo6eloBIQH87Pz7Mfe5eqkyMzvylbbECcQiLatxjjsS3hTAPXDui7+wTkpP69cU4y9blPOL9QiqZ30jqpGpZ0yCKcQz7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390410; c=relaxed/simple;
	bh=PlRHNLQ7fDzAGszYnivbKBVfStOPpI/t3fowEHzOZxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBhoX47SKmGA2OR1ihPuYRxWkauvRQCRin15+PMCAeVG/Hf3bYXpdSNktRm3DryRe/hB/u+6hov0yt87iOXEMD5+ilArWOaKhA/FqfXVMCgaK0mA+qGA+vAumHZuR/hNXPDxZCgHaYYBZpwLz9Ap1Dc8UwrrXV5+sxoNRtx4A5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZiIXcr4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZiIXcr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390408; x=1811926408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PlRHNLQ7fDzAGszYnivbKBVfStOPpI/t3fowEHzOZxs=;
  b=FZiIXcr4HY3dUBngBqE1wxCftOPiOz35PdE5VBttMGzSEIjdSt5QE5k9
   axzPflo7Kv0wwSaw8l9PpvMfXs7IS8J1lngAhfsHrxR2xDThxT+1B3ChY
   BnOuPUl7AsozXVCUT0iiyd9Ot+jWpyzLZTSPK5sFUO6nNScCYmv/8mpof
   dtt4szu6JnpsEG73PaYqGIf2/u3m5Mt3sH3CFZ4d3RtStztW9ISrxtaMG
   SosSqyyfs84WY85H2nfRTWd+drEmdwyMPqd+3R6QFiMOfP5NpYlhDFzwH
   VzsIjp5vQRBdbZabD9AgAQFK6rZSqg7nFqKVJ7g0Exsh2xE4gs4T5kDlQ
   w==;
X-CSE-ConnectionGUID: 3u9s/hU0RXeiyxmcySGhHQ==
X-CSE-MsgGUID: DvXHJFtmRdequKH/dGMv8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81031888"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81031888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:53:10 -0700
X-CSE-ConnectionGUID: 7jo3u1S4QqqdtShw7G0h9w==
X-CSE-MsgGUID: zVn11wIGRcSwy6don3GLkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="242821885"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:53:08 -0700
Date: Tue, 2 Jun 2026 11:53:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
Message-ID: <ah6Z8d4aCSykFaaa@ashevche-desk.local>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-5-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-5-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 01, 2026 at 04:10:28PM +0200, Cezary Rojewski wrote:
> Code line reduction and more transparent variable naming.
> No functional changes.

...

> +struct catpt_stream_runtime *catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
>  {
> -	struct catpt_stream_runtime *pos, *result = NULL;
> +	struct catpt_stream_runtime *stream;
>  
> -	list_for_each_entry(pos, &cdev->stream_list, node) {
> -		if (pos->info.stream_hw_id == stream_hw_id) {
> -			result = pos;
> -			break;
> -		}
> -	}
> -
> -	return result;
> +	list_for_each_entry(stream, &cdev->stream_list, node)
> +		if (stream->info.stream_hw_id == stream_hw_id)
> +			return stream;

Please, keep a blank line here.

> +	return NULL;
>  }

-- 
With Best Regards,
Andy Shevchenko


