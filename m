Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590E46A00F
	for <linux-sound@vger.kernel.org>; Wed, 20 Mar 2024 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.235.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710961250; cv=none; b=TUnjLBSSPelYMe++UXTorLqQYEFHzhFOsqKcF+pFq8koJz8FGgzZbSBoxE9M9ksKCqGGhBtVzhRMjV8nJuStu0xR6Gbq3elSCzeUkcyix4A4zY/KGb7CBsbFfdOGMncd1W0q+uZvpZv0npvh7UtgWvzbYDH6kylq5nuIFPWxTNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710961250; c=relaxed/simple;
	bh=lPzMDtOJu7AylTdfoGojNib+QZW/x2guHIX1y8d48aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Erl3QiCsGmrPcrIhSt7wz9P+LqI7GtSdcc4vOIUe8u3Bc4BOhPMzTH1CYQZx0xoba024PEs1F0IcFIWS8k4ZQGU1urR5DJNKRC/IPxIGhuxaXtXqXnWCrkKG9NVuMwrJRQHBw42DpnA+CyCo8MLbP+EgqLZ02gLjJ8J8YwKuRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr; spf=pass smtp.mailfrom=alu.unizg.hr; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=fdT0z8Vo; dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b=EFVbx3I6; arc=none smtp.client-ip=161.53.235.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alu.unizg.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alu.unizg.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="fdT0z8Vo";
	dkim=pass (2048-bit key) header.d=alu.unizg.hr header.i=@alu.unizg.hr header.b="EFVbx3I6"
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id 0993B6019C;
	Wed, 20 Mar 2024 20:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1710961244; bh=lPzMDtOJu7AylTdfoGojNib+QZW/x2guHIX1y8d48aw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fdT0z8Vo3GtHxZ2p7Wh41OB3SyI4tkFPW7xnW0DFI+zA/76pjKdLFv/KpLgd41xO8
	 DvxgrB9cH7SAEvE+sXJpjt3KjvsZm0d+J8SSQFJ/0AprcpnQ1qqNykEKUMYTU9SD6J
	 QUUkVl9TaIaK2qLCplNI4YAH9wFktcPciYafekjOAfkhEob1y/7m5IHoEAISKIhrUP
	 VWTD5k/qaBB2fB2FQaqmQGsad9W5Wfn2f8XZ7+2WmJlGyV+2D0HCyL+FwE1F1hW/Hl
	 xVngMKTBEl5EkyNDdDx4esP2gbnCuSGsCpGNqZt1oLUSXvL9aUnFZ9LcYWF8uudYyC
	 VaFBMrneh3idQ==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_9rNAHq1nJ3; Wed, 20 Mar 2024 20:00:33 +0100 (CET)
Received: from [192.168.178.20] (dh207-43-75.xnet.hr [88.207.43.75])
	by domac.alu.hr (Postfix) with ESMTPSA id D5A3A6015E;
	Wed, 20 Mar 2024 20:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1710961233; bh=lPzMDtOJu7AylTdfoGojNib+QZW/x2guHIX1y8d48aw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EFVbx3I6guNWDBySPlWnzi2DnRFLwXNWiHxOdrvyiBaOD5VElbIS4E+PKnn5FevZF
	 zUoqvbDz1YCLC5Swlmd5lvg8A4JPGSUm7XONMEdktLA1ft8zCGwKGvFve2NM3N4BO3
	 SPnqS40PFmn/Efa0X51qHLXjDri1bRa/sccITAX+tEYdCH1hXxGfQ10g6cvwxAh7UI
	 lX7sKLtfOZ+fOoc+RnotBFGCySk0KN8TK1td9lxdsK2z7CVqGG6f+3+Nitn5A4rao8
	 Ka/JqcpGkHd2+QaVGSJb12e03rO8vQCjynzZVWRydbWrcxoLvGu5IGMYgRiUrGieFM
	 6vuGNlUO2T4IQ==
Message-ID: <3ff7296f-b53f-443e-8188-f102707f9593@alu.unizg.hr>
Date: Wed, 20 Mar 2024 20:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Fix unannotated kfree() cleanup
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20240320062722.31325-1-tiwai@suse.de>
Content-Language: en-US
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <20240320062722.31325-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/24 07:27, Takashi Iwai wrote:
> The recent conversion to the automatic kfree() forgot to mark a
> variable with __free(kfree), leading to memory leaks.  Fix it.
> 
> Fixes: 1052d9882269 ("ALSA: control: Use automatic cleanup of kfree()")
> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
> Closes: https://lore.kernel.org/r/c1e2ef3c-164f-4840-9b1c-f7ca07ca422a@alu.unizg.hr
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/core/control.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 8367fd485371..fb0c60044f7b 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1275,12 +1275,12 @@ static int snd_ctl_elem_read(struct snd_card *card,
>   static int snd_ctl_elem_read_user(struct snd_card *card,
>   				  struct snd_ctl_elem_value __user *_control)
>   {
> -	struct snd_ctl_elem_value *control;
> +	struct snd_ctl_elem_value *control __free(kfree) = NULL;
>   	int result;
>   
>   	control = memdup_user(_control, sizeof(*control));
>   	if (IS_ERR(control))
> -		return PTR_ERR(control);
> +		return PTR_ERR(no_free_ptr(control));
>   
>   	result = snd_ctl_elem_read(card, control);
>   	if (result < 0)

Hi,

Thanks for the fix at such a short notice.

Just re-ran the kselftests for alsa, so far no kmemleak.

The test was done in the same environment, Ubuntu 22.04 LTS with torvalds tree kernel
(vanilla v6.8-11743-ga4145ce1e7bc + fixes).

You can add:

Tested-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>

at your convenience.

Best regards,
Mirsad Todorovac
