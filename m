Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9C3A5430;
	Mon, 22 Jun 2026 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123922; cv=none; b=rYvQEGB91uhhFBxHyUBovCMIUBtE/8Ei/nNqHC39A4NwpRBXHDqgPFg4meXserNMmhBfE6stFxKHpBhQ5zUlB0CyNozUu5UZhtb1GLCLcVXyWmyesO2kH4u5E3Szfb8CD6B726buGFDbHwx3JAeISsVJUjUZfmcJ2o28K9JIKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123922; c=relaxed/simple;
	bh=8ytbAmCNhbMsvW71eZJ7xGhofajdwDH7mIpD3eZiW4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8VnlVDgq6KY3yNYJaI2hMct2F/dBnVyOysTTAI0JLe4VLcQUozI5iGP14NlabTejAwoAgSzdKIKMOyLr+Xo18txlpzgN9IjsqGJ8e6zoU0H1L0qSkT/p9uPA0bpSI50nHj3d2Lb5Q1SFYYjuFhN4YtEbJBOW9BG5Da1EC36TXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=b4bi+pAn; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="b4bi+pAn"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D8A1B2FC005B;
	Mon, 22 Jun 2026 12:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1782123421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sB2j/8UOwav+/uHf53HBWKO5WylLHjzUuimdl3Bj1EY=;
	b=b4bi+pAnXvJMZ7Ra1ES1KBWBGlYywI8lJncOu57Th+wp8RM8vD8HSig9ppdckfY6zHm8sY
	dM5PAWkCLjb7xiEXK/oju1Z95gXsdofKQcZmyKUQ7dvs4PZGiNfj0lwCxc6Rcjc0fCsEdk
	YHSKM9ggS8EvYjFijjKkVSUHk0qOACQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <79bf40d3-6f77-4bf0-93c1-ba48220d7d9a@tuxedocomputers.com>
Date: Mon, 22 Jun 2026 12:17:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Aaron Erhardt <aer@tuxedocomputers.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260519155047.106096-1-wse@tuxedocomputers.com>
 <87ecj6lj7u.wl-tiwai@suse.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87ecj6lj7u.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 20.05.26 um 07:53 schrieb Takashi Iwai:
> On Tue, 19 May 2026 17:49:48 +0200,
> Werner Sembach wrote:
>> From: Aaron Erhardt <aer@tuxedocomputers.com>
>>
>> Add a PCI quirk to reduce the volume of the internal microphone to prevent
>> extremely noisy signal.
>>
>> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: stable@vger.kernel.org
> Applied now.  Thanks.

Quick question: To which branch exactly? I can't find it here: 
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/

Best regards,

Werner

>
>
> Takashi
