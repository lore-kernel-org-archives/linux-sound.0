Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301421DB13A;
	Wed, 10 Jun 2026 02:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057494; cv=none; b=uUL56zFkJmSL8AZhXvTLSuJiWUp6+AUvxUKliXjCu36iBtrOAeG8teB/BZ9I1MaZ6m/dQxr05lBwWsVn5T4pVeA2MH96Ro/qFBeXoXHIDS5f49X6liKrcyFw/QGpTQxRfQ2Gqyt8tzLaEFailV449Ub5UrB4+DhgDZQruxvnJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057494; c=relaxed/simple;
	bh=gLSIjdG5BuDTMQwQwS1uDaeNaGsEX59WvN3iuG/bqs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuy7I82/ItwPsIhU/Ax2CNTnKFwlzTbBSgmJ5dCYIh7MrBDeqcqRCdASiZNxWVoCc5dlzmHjEtlPl6kRxHO8eyh9j/05TeBNMKilV4N47+WDzqliTzsviRJAnCpk4iSgd2s+TE27pBTB7WHzE4IDmWo+hZJMWlQHA37zuH7lFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vb3hlGfU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vb3hlGfU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+332RfviDFmosxfnra0lv/IVT8wsowCDLEf5I3GvlTY=; b=Vb3hlGfUuMJJuhlyghliwYMSz8
	q6qe4bLn8KyNUZkXxAldyvHJqlPgAGAkdtNgApcJShCMrcviS/1lgGw8q6FhIpVZzif9Bgw/BXZxf
	GpOriiWnwrvmVRz1E9ZbW1ah+w4J9T2mccSiFyokCzNlKyr4d693Ox06l6vr3lF6mon0BkEzBciKo
	XTqEtfnRbCT/yZYMCYs855fV8p8yz8hd/uMFzRziDhCIErzEp/4WiVJGa/EwouShL5ost+6FZnoxM
	haLhQbDzosbTlFpWDydbfUGjQrgqacNgwjEdLgbNcm0gSXjYEsJgFZ/r6bXk+YEm+ZwfcdCZH4Xzn
	PjW7AuDg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Pi-00000006gXZ-0Q5y;
	Wed, 10 Jun 2026 02:11:30 +0000
Message-ID: <115493bd-8a8e-4192-ae75-6bfaf0e99a90@infradead.org>
Date: Tue, 9 Jun 2026 19:11:29 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: docs: remove references to removed
 CONFIG_SND_HDA_POWER_SAVE
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rhys Tumelty <rhys@tumelty.co.uk>
References: <20260610015614.41530-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260610015614.41530-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 6:56 PM, Ethan Nelson-Moore wrote:
> The CONFIG_SND_HDA_POWER_SAVE option was removed in commit 83012a7ccbb9
> ("ALSA: hda - Clean up CONFIG_SND_HDA_POWER_SAVE"), but references to
> it remained in documentation. Remove them.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/sound/designs/powersave.rst | 5 +++--
>  Documentation/sound/hd-audio/notes.rst    | 3 ---
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/sound/designs/powersave.rst b/Documentation/sound/designs/powersave.rst
> index ca7d1e838b4d..4b9d6d0b0d98 100644
> --- a/Documentation/sound/designs/powersave.rst
> +++ b/Documentation/sound/designs/powersave.rst
> @@ -3,8 +3,9 @@ Notes on Power-Saving Mode
>  ==========================
>  
>  AC97 and HD-audio drivers have the automatic power-saving mode.
> -This feature is enabled via Kconfig ``CONFIG_SND_AC97_POWER_SAVE``
> -and ``CONFIG_SND_HDA_POWER_SAVE`` options, respectively.
> +For HD-audio devices, this feature is enabled if ``CONFIG_PM`` is
> +enabled. For AC97 devices, it is enabled via the Kconfig
> +``CONFIG_SND_AC97_POWER_SAVE`` option.
>  
>  With the automatic power-saving, the driver turns off the codec power
>  appropriately when no operation is required.  When no applications use
> diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
> index 6993bfa159b4..1412a8eabfa8 100644
> --- a/Documentation/sound/hd-audio/notes.rst
> +++ b/Documentation/sound/hd-audio/notes.rst
> @@ -341,9 +341,6 @@ hwdep option above.  When enabled, you'll have some sysfs files under
>  the corresponding hwdep directory.  See "HD-audio reconfiguration"
>  section below.
>  
> -``CONFIG_SND_HDA_POWER_SAVE`` option enables the power-saving feature.
> -See "Power-saving" section below.
> -
>  
>  Codec Proc-File
>  ---------------

-- 
~Randy
