Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ECE20330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238239; cv=none; b=nATVnmTMmvK/cjm3B/TLT70LJ6nx4ksrxqd/xl6azoWYumZzCPkUsa2jrZFKJ8bsqJVzclrA+YrmAAmda7oRrkz3k2sVJu0fgoZGLwDet0I/Qe8NZE+MtQ2VdL7Q7pkoNlAb5iKysHf6Mmq11fDJOTCYVRlqJ2YmRuv84a0yq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238239; c=relaxed/simple;
	bh=cF/XznwjPOiL89gPAquHKsWuo2x3HviT6PTUL/s2uds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujbXrUvIN73gidKJBTUeU6YN3r+O5S1VSMAaheNpWVH3hP2oW1YUG5agOIaqX4c7XSEF+AI5ucUms+hGlO7FclbS1OKZxrbRjmOiOVI+W2jILgxRM9C5jBKSe71ZvZx9IntTW9F5fFc3O/cIaZj/bHevk7qqjWzewpVzfhW/2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS1jcZdw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS1jcZdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719238237; x=1750774237;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cF/XznwjPOiL89gPAquHKsWuo2x3HviT6PTUL/s2uds=;
  b=dS1jcZdwZ5SRuNvbtiLJHlaa+0NKxk0TRyJnzCwhYVVWMYJN5Qk9753u
   sQ3ifpez3zL4688YOmGQqSYHVmZOGxx4wOj+4ttPq5dN4GJ5EAgMyYu1J
   SV414EIZ5FsuPVW+4vuIo7x8gVIFF9usgVXWb2ZL+yaaqkwnx1z1nenxe
   9o4YJjkBOObTa5thJrOOk3Kc/ogcDz/TlojpkRcOp49Gy4vaUT73MI3pp
   sSp3nlNcnlMwC6nb1+FeZMrlbvKbigGvUYAP4vB9KZTdQHF1QrhaozbNf
   vpGNWP793gk7BMk6tdJrCsNFbRRKRDaMy4v72ZS9VVWOQg4cDlA3VUOao
   A==;
X-CSE-ConnectionGUID: 0OZ1ajPSRsi+bvgF7n7QcQ==
X-CSE-MsgGUID: 795gIPLfQhSmnjeDF0hSgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="12213967"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="12213967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 07:10:37 -0700
X-CSE-ConnectionGUID: WNu5dSkERi2+8QjtE/UJVA==
X-CSE-MsgGUID: r+Q+hFQvR3WZywN56RcUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43183089"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 07:10:36 -0700
Message-ID: <2c8378b3-5745-4694-b06c-4fc376ceadbd@linux.intel.com>
Date: Mon, 24 Jun 2024 16:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] ALSA: pcm: optimize and clarify stream
 sychronization ID API
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
References: <20240624131127.498605-1-perex@perex.cz>
 <20240624131127.498605-3-perex@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240624131127.498605-3-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/2024 3:07 PM, Jaroslav Kysela wrote:
> Optimize the memory usage in struct snd_pcm_runtime - use boolean
> value for the standard sync ID scheme.
> 
> Introduce snd_pcm_set_sync_per_card function to build synchronization
> IDs.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---

(...)

>   void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
>   		     const struct snd_pcm_ops *ops);
> -void snd_pcm_set_sync(struct snd_pcm_substream *substream);
> +void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
> +			       const unsigned char *id, unsigned int len);
> +/**
> + * snd_pcm_set_sync - set the PCM sync id
> + * snd_pcm_set_sync_per_card - set the PCM sync id with card number

Above doc line seems like mistake in this place? This function is 
documented below ;)

> + * @substream: the pcm substream
> + *
> + * Use the default PCM sync identifier for the specific card.
> + */
> +static inline void snd_pcm_set_sync(struct snd_pcm_substream *substream)
> +{
> +	substream->runtime->sync_flag = true;
> +}
>   int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
>   		      unsigned int cmd, void *arg);
>   void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index a6d59ee9eb52..8d1a24a2c43d 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -516,19 +516,37 @@ void snd_pcm_set_ops(struct snd_pcm *pcm, int direction,
>   EXPORT_SYMBOL(snd_pcm_set_ops);
>   
>   /**
> - * snd_pcm_set_sync - set the PCM sync id
> + * snd_pcm_set_sync_per_card - set the PCM sync id with card number

Here ^

>    * @substream: the pcm substream
> + * @params: modified hardware parameters
> + * @id: identifier (max 12 bytes)
> + * @len: identifier length (max 12 bytes)
>    *
> - * Sets the PCM sync identifier for the card.
> + * Sets the PCM sync identifier for the card with zero padding.
> + *
> + * User space or any user should use this 16-byte identifier for a comparison only
> + * to check if two IDs are similar or different. Special case is the identifier
> + * containing only zeros. Interpretation for this combination is - empty (not set).
> + * The contents of the identifier should not be interpreted in any other way.
> + *
> + * The synchronization ID must be unique per clock source (usually one sound card,
> + * but multiple soundcard may use one PCM word clock source which means that they
> + * are fully synchronized).
> + *
> + * This routine composes this ID using card number in first four bytes and
> + * 12-byte additional ID. When other ID composition is used (e.g. for multiple
> + * sound cards), make sure that the composition does not clash with this
> + * composition scheme.
>    */

