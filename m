Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F235235C04;
	Mon, 13 Jan 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761814; cv=none; b=Noc8mtvBEVzN/fS43EuvQbanZJsKB6TyGZkVak8A5GD8YsZ4kKAp5OuNd1SYSxFAjmXBIXhOicsVw0B1EUlJrtqf1rRs4Wcsl8ymCDsHeWUd1TQktoZg5NkjRiRfLZtqLix3zMDGPfXa6IFjvJU+oSZt895orYjCz70h3puerF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761814; c=relaxed/simple;
	bh=ZVECrHmxPmB2WkcJ89sUmKgWWqwyvAJ1esD+sCK6kdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCm11Z/wVevhR0v6fhX26MpwD28sQTx4O6qIZSjDxNVmLSs1Ovzd/MyfUjfe0EAEH9is9ZRt4w/2gFesADcloqSQ2R2oKpYFAiSuK+EHElXqgURTFBjTmMbORn393nY3omxdPc2NjCLNPTng39XSRKU6TS7df24ls59e0Go3Qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VOeZB3qU; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VOeZB3qU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 082FF60006;
	Mon, 13 Jan 2025 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736761810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU72BaMjNSmJe9Ge+YHzAwH+OjoKgcXuhVon0nVnmao=;
	b=VOeZB3qUg687ChFI3EHdVOq7i6T8dfBG57Q6ss38N5qUmgghAERWolLNpvLeBdU02YaXMa
	U7rRpDITi2YWdedNoiQE3Kr7n8ZhMDD5useMRScO0moQd0mFDJy4KQF32AveIMks/tuIrN
	g7HmecikN6DB18AKlLSRPgnff+yrKC/7EfNDz820RRxsiN3mtCOtGZNf4AoHelmPYh889D
	9GteaFCM2nKkOhtaEPxd2Zoos6JyCBY/X9+V3RLTJSd/U5K5cObVbVFWbMJHOZBZDsOFm+
	89qPlMlTdg2ixu2OM9uPcS7fy9ZqibqVh4LVSUntNoSIvhzrqyYL6KfjCvC1SA==
Date: Mon, 13 Jan 2025 10:50:03 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Use ARRAY_SIZE() to calculate
 PEB2466_TLV_SIZE
Message-ID: <20250113105003.3b910b00@bootlin.com>
In-Reply-To: <20250113001001.400669-2-thorsten.blum@linux.dev>
References: <20250113001001.400669-2-thorsten.blum@linux.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Thorsten,

On Mon, 13 Jan 2025 01:10:01 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> Use the ARRAY_SIZE() macro to calculate PEB2466_TLV_SIZE and improve the
> code's readability.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  sound/soc/codecs/peb2466.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
> index bb9ca6354ae1..a989cfe058f0 100644
> --- a/sound/soc/codecs/peb2466.c
> +++ b/sound/soc/codecs/peb2466.c
> @@ -26,8 +26,7 @@ struct peb2466_lookup {
>  	unsigned int count;
>  };
>  
> -#define PEB2466_TLV_SIZE  (sizeof((unsigned int []){TLV_DB_SCALE_ITEM(0, 0, 0)}) / \
> -			   sizeof(unsigned int))
> +#define PEB2466_TLV_SIZE ARRAY_SIZE(((unsigned int[]){TLV_DB_SCALE_ITEM(0, 0, 0)}))
>  
>  struct peb2466_lkup_ctrl {
>  	int reg;

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
