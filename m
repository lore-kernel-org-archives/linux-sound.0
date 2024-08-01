Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91A1A57C5
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722517744; cv=none; b=oFf0leXhdn/d+bZ4AV/EmgvXKs1fYP7xcVAF/YuCdPFlgOgfKfJe2jTLuOwqz4Ps3lssP78KMX6ngC0b8CxNnBBrKy6acmKs/fBHG+UnxBlz4hMfe3JS3OR8mbArh4eCf+ffQQH5boTnCeERvSKeiykff5jC+cKA/4eCYcuEDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722517744; c=relaxed/simple;
	bh=iffcO17agYLVMGm5nGnKD3vKGu63G7RQVHCgaY+KI5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GCs7DESdbRGCI+ssB8hur7W0DsSR61VsIgHWGALRD51Fo08+JExLyUtmvTGRGzp64iUcJVR5OmMZOC7bpja/XbyXC5YiZGc0VFEjppFKeYGqHMoUA0LJ44zicFzKuswYAcWBZ47Y3VEDH/2QWz70IkFHPayWoki3WUTbxRPB2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=lEGezGLg; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="lEGezGLg"
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id ZU0hsoQO6nNFGZVY8sP2Ke; Thu, 01 Aug 2024 13:08:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id ZVY7sm1M7cYJ2ZVY8seE8A; Thu, 01 Aug 2024 13:08:56 +0000
X-Authority-Analysis: v=2.4 cv=apm0CzZV c=1 sm=1 tr=0 ts=66ab88e8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=VwQbUJbxAAAA:8 a=0mdKdCKJ4Rrql2SUlNgA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NkAiNWUkCoIRyYDoQLEqDnt4FZOujt+jX4L+GRdPUDM=; b=lEGezGLgMnQlKrrD2vVgZVSdI4
	T5cZqRBVNqOr/dEV1EhvUtnqF+4CxbWk5Q6pzs3qmjzOlp/hh5Gk8+FG0wIkHiVV90z/YnqkLTtgR
	LK40AQ5P7bgZiEJ/OtzNECIVx9VWOYsWsCiiWdrK6LPjNuKxVj29im04L9Am9FL9EDm3KDRf4mW/y
	p+wwtB+duGrzd7Vpmc8jgGA911UYOg4lCfaoaGLnzkYb3jweYd9w6LJfb3B/xKVduTEMK9gZfVLYU
	z+Nv1aRQSdiLg8KYWfxB/67Bun23d5aCv8A8UQsvKEstPDq53L3hhUizo16NqBxGmfv7V+4kF0AvV
	Imj3rPMg==;
Received: from [201.172.173.139] (port=59502 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sZVY7-000jO8-1e;
	Thu, 01 Aug 2024 08:08:55 -0500
Message-ID: <0436d53d-23c9-4058-9e8e-84b37f4d2241@embeddedor.com>
Date: Thu, 1 Aug 2024 07:08:54 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Annotate snd_kcontrol with __counted_by()
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20240726152840.8629-1-tiwai@suse.de>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240726152840.8629-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sZVY7-000jO8-1e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.173.139]:59502
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFI6PJoiLbR+C5UB/Ui04g4M//N2PCuewH2grF519qATHqTLZTWCPxyr/zYjEa5zhXNdHxvq36ZsVSPZtJxB5mKMtkY1HHjU2RB7eLyfvSQ+1H3yByTD
 Ko/ZHCPBNxroSRHLsXcvImmOvTjBKa7nqin6RjxUpkCE2CLEe4dHyn0r9adcI9Hx3Z198qaibeT88WJ5zaf894d/lBrPW0SrDiQcRFCPmSEOGZZKJlYmwib0



On 26/07/24 09:28, Takashi Iwai wrote:
> struct snd_kcontrol contains a flex array of snd_kcontrol_volatile
> objects at its end, and the array size is stored in count field.
> This can be annotated gracefully with __counted_by() for catching
> possible array overflows.
> 
> One additional change is the order of the count field initialization;
> The assignment of the count field is moved before assignment of vd[]
> elements for avoiding false-positive warnings from compilers.
> 

Thanks for catching this!

> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

-
Gustavo

> ---
> 
> This one seems out of Gustavo's radar.  I have no compiler that can
> actually check this annotation, so it's a bit untested.
> 
>   include/sound/control.h | 2 +-
>   sound/core/control.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/control.h b/include/sound/control.h
> index c1659036c4a7..13511c50825f 100644
> --- a/include/sound/control.h
> +++ b/include/sound/control.h
> @@ -81,7 +81,7 @@ struct snd_kcontrol {
>   	unsigned long private_value;
>   	void *private_data;
>   	void (*private_free)(struct snd_kcontrol *kcontrol);
> -	struct snd_kcontrol_volatile vd[];	/* volatile data */
> +	struct snd_kcontrol_volatile vd[] __counted_by(count);	/* volatile data */
>   };
>   
>   #define snd_kcontrol(n) list_entry(n, struct snd_kcontrol, list)
> diff --git a/sound/core/control.c b/sound/core/control.c
> index f64a555f404f..c3aad64ffbf5 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -237,11 +237,11 @@ static int snd_ctl_new(struct snd_kcontrol **kctl, unsigned int count,
>   	if (!*kctl)
>   		return -ENOMEM;
>   
> +	(*kctl)->count = count;
>   	for (idx = 0; idx < count; idx++) {
>   		(*kctl)->vd[idx].access = access;
>   		(*kctl)->vd[idx].owner = file;
>   	}
> -	(*kctl)->count = count;
>   
>   	return 0;
>   }
