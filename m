Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4jY5LX4h"
X-Greylist: delayed 398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 05:38:31 PST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FED4DB;
	Mon, 11 Dec 2023 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702301512;
	bh=ZbhJvDZ4J8DSoVnmT01KLlPScbl5+K/exJcCzkD1IaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4jY5LX4hwFqHL541gjzRwtzNMDErKcqccncYrm7AFa2820Byy0P9gIDznieXsETdv
	 aoVxhkQPSPO4vYE8KfiV3R2tnM4CP44ZBqfDA1Mc9pt6TMfqTn43t3o1CTueP2stAW
	 eXwz1ArrLRZlnVNCN/Q7yyFwtIE/x3ukOzZBQQL0gQODew+R1RP7Z04/PlqmPpLzvq
	 ndEFRof85Am05NuNm7usF+i7ppQb9qCppG50A9tHuu0dr554ZaFwlHynfPz3jsT+SQ
	 1gWUdTXDLfT4f2HleESzUFodpbOtEZn1MXh5vG8Kva/mMfUWMLcFMr70EblT2TfYPH
	 zbsi25b6bUtcw==
Received: from arch-x395 (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: evelikov)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C92CD378110F;
	Mon, 11 Dec 2023 13:31:50 +0000 (UTC)
Date: Mon, 11 Dec 2023 13:31:49 +0000
From: Emil Velikov <emil.velikov@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marian Postevca <posteuca@mutex.one>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 03/11] ASoC: amd: acp: Add missing error handling in
 sof-mach
Message-ID: <ZXcPRc8xGKt4euth@arch-x395>
References: <20231209205351.880797-1-cristian.ciocaltea@collabora.com>
 <20231209205351.880797-4-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209205351.880797-4-cristian.ciocaltea@collabora.com>

On 2023/12/09, Cristian Ciocaltea wrote:
> Handle potential acp_sofdsp_dai_links_create() errors in ACP SOF machine
> driver's probe function.  Additionally, switch to dev_err_probe().
> 
> Fixes: 9f84940f5004 ("ASoC: amd: acp: Add SOF audio support on Chrome board")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  sound/soc/amd/acp/acp-sof-mach.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
> index 1d313fcb5f2d..6f0ca23638af 100644
> --- a/sound/soc/amd/acp/acp-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sof-mach.c
> @@ -112,16 +112,14 @@ static int acp_sof_probe(struct platform_device *pdev)
>  	if (dmi_id && dmi_id->driver_data)
>  		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
>  
> -	acp_sofdsp_dai_links_create(card);
> +	ret = acp_sofdsp_dai_links_create(card);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to create DAI links\n");
>  
>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -	if (ret) {
> -		dev_err(&pdev->dev,
> -				"devm_snd_soc_register_card(%s) failed: %d\n",
> -				card->name, ret);
> -		return ret;
> -	}
> -
> +	if (ret)

Do we need to undo acp_sofdsp_dai_links_create() in here? If not, please
add a trivial note in the commit message.

With that the series is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

HTH o/
-Emil
