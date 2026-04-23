Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074137C914;
	Thu, 23 Apr 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969458; cv=none; b=BS/Q+pyTGlrjX5CiuD5FyYaugbkdtrL86V5KzFb+uFzr3JQusxPEP78yCaX6QyPK5OJJNh5q3HwsGuAXni7BWDFVyFhmiW7/DLeIEROdYJ8FVA1qQyRzPT/tazVUSaL53Ki3MseuiCDwUpxSB3vOLDD9GSe3EZ0iwbIZ/5EWqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969458; c=relaxed/simple;
	bh=zd36ffggd3VWRH4Dmqd/xnuvocBVqlQil8+V0iyjQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHDrWotHS4TajJzGap502T4LU/YMa7qO20C3iFYvbkN7XDyfur24mSG62XopyQgsfRVpV1HHIEIeuivoXgwNOrzwdnbeLg0b6DxAmtfT9EvVqbHDK/9h/kAg4uyDWHbxKP/Z3uus6dZ0+2YGjmJwRxcVoP0IgLGt3CpB2DfWJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=geBHZ4DJ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="geBHZ4DJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZjfbCyv+q8Q2fdC9++f/81D7Y4BHFovHuItmWHcIQrk=; b=geBHZ4DJTe2RwY5N7I3cdKLxhz
	B7aYxVtPSWp8ZFpm1cgjU7KiELn0FPpr4nRxQ5cGZDkkX8/MH0Rx8MRkNYtyfrbkwS7l6EEqEpggc
	sDQzW/63j/1EheHC1UW5ULReaH14kqnUJTboR7gOrHVOzloMDkVFUiiJRLj1US2I25fIpNY/WsDh+
	iKazRHOJRVk0ZggjdY3oMENzra/fC2SSp82t1KXvzO460V4MljqekDgb6Gb0Q3oDmwSJwrIcngwY9
	3s0HyGktgiY/qRa/fZN0uvpHQhEMXsBWZMMzIEkCsT7qVLsTbjRszfshRV5ZEx2Bd25UY/QXBMYJ2
	9FJf35GA==;
Received: from [179.111.22.136] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wFyvZ-001EK4-5G; Thu, 23 Apr 2026 20:37:28 +0200
Message-ID: <9b11564e-bb1c-b606-4968-9fcecb10c181@igalia.com>
Date: Thu, 23 Apr 2026 15:37:23 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>, Umang Jain <uajain@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260421192214.77819-1-gpiccoli@igalia.com>
 <e27dfa2e-ebe9-4cc4-a2ab-6f1f8140bbdc@collabora.com>
 <fdba7581-72b2-791e-c21b-e629d7b86457@igalia.com>
 <823eb16f-339a-499a-9fb1-27a166f8838d@sirena.org.uk>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <823eb16f-339a-499a-9fb1-27a166f8838d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2026 09:14, Mark Brown wrote:
> On Tue, Apr 21, 2026 at 05:23:08PM -0300, Guilherme G. Piccoli wrote:
> 
>>>> +/* List of DMI quirks - check acp-mach-common.c for usage. */
>>>> +#define TDM_MODE_ENABLE 1
>>>> +#define REMAP_DMIC_BT 2
> 
>>> Since the list of quirks may grow over time, it might be worth differentiating
>>> these macros from the common ones — either by adding a `QUIRK_` prefix (or
>>> similar), or better yet, turning them into an enum?!
> 
>> Hi Cristian! Thanks for the suggestion, I'm OK either way, let's see
>> what maintainers prefer and I can easily spin a V2 with such change.
> 
> I think Cristian's suggestions make sense.

Thanks!

Closing the loop, V2 posted here:
https://lore.kernel.org/r/20260423183505.116445-1-gpiccoli@igalia.com/
