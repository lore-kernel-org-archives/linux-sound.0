Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19D8F7D;
	Wed, 22 Jan 2025 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737512176; cv=none; b=pIllj9VljmrLrKX8ubUBF/SruBLOLcuNARuEkw6FvtnxNLUGIZRcecJpIJt9cDX4SYOWYF6rfiT+xuibinV+5CbrZRXIUbEtxGPMaCKAoTconRKIy63vTgBQCED400osgjGHEHolmOlJcSaTbAyHjTTtdJWzzf6CtW0W43aiLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737512176; c=relaxed/simple;
	bh=8xwLFLit+ijop827QEcl/HrVYI09sb3XTz6B9ifKMw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWy+zVHw8aM2v6Sk1aV8vc5aL6UQ5fB3jiYzaq+mU/YVtQR9hDsfAwJSjH7tdIuZ2hdfH+rpEcUYjJmPc8MLt4EMFMuTferb7n3+FYqVLnZ7rtI1vEG4FxvbbfYwNmTh1VpaCLpgM2W0+M4rDZlXe0miIxuvfV9+gH1lRRa9eIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=QBbxWbjp; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="QBbxWbjp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=HAzEy196puWokmdw930QhDeann4ocmMriqpBLYFSM04=; b=QBbxWbjpUy3lEc9P
	nJpPl+lIMEMVYKyas//RR4XvWFx9Dt5DYIQraM0vlxJ8kb588VOuRyGc5ZaVDLnE7UDzsMwxzDVb4
	GHOfPolKIaQDwHXGMzhCSBTVwk0/BOcDWD6wzHCTo3vCLi/5ppqbqMHVZp6H6FfO4pfidqlxJAlJq
	DcAvZm14fc+FvJxgBNp485GDRr/TUi8k1GgUu9FXlxVqU4gsr8zni7Ab6I5tz/oJtoyihkkSX27fd
	RCG5MyUB3fZKRV1p10ea3gSSs+BJA3/bkPLBFGXkMaergxUsFYJ840v7P9ABM21uFruqNVPlGrbgi
	Fqh4JEkX+sg6aXrWCQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1taQHr-00BPMV-1w;
	Wed, 22 Jan 2025 02:16:11 +0000
Date: Wed, 22 Jan 2025 02:16:11 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: lola: Remove unused lola_(save|restore)_mixer
Message-ID: <Z5BU62Go409LFd81@gallifrey>
References: <20250122014301.447938-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250122014301.447938-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 02:15:44 up 258 days, 13:29,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> lola_restore_mixer() and lola_save_mixer() were added in 2011 by
> commit d43f3010b8fa ("ALSA: Add the driver for Digigram Lola
> PCI-e boards")
> but have remain unused.
> 
> Remove them.

NAK!
This lost the .c file change.
I'll do a v2.

Dave

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  sound/pci/lola/lola.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/pci/lola/lola.h b/sound/pci/lola/lola.h
> index 0ff772cf66e6..25f72f9e3f9b 100644
> --- a/sound/pci/lola/lola.h
> +++ b/sound/pci/lola/lola.h
> @@ -499,8 +499,6 @@ int lola_init_mixer_widget(struct lola *chip, int nid);
>  void lola_free_mixer(struct lola *chip);
>  int lola_create_mixer(struct lola *chip);
>  int lola_setup_all_analog_gains(struct lola *chip, int dir, bool mute);
> -void lola_save_mixer(struct lola *chip);
> -void lola_restore_mixer(struct lola *chip);
>  int lola_set_src_config(struct lola *chip, unsigned int src_mask, bool update);
>  
>  /* proc */
> -- 
> 2.48.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
