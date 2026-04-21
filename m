Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1188287503;
	Tue, 21 Apr 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803007; cv=none; b=jJVwbaSnyvtUTkUijXKW2ow3FRmV99WAkf/9AxoPtgUKayk5fSo8WVlGIQZeGolEsXymgTd/A/v15AWki4fEPZ5NqdJCYILTOJRNNW9sHim5jlmM0yh7r8dSD6QY3YatF9GGidxeijqFEXM9YVZ3s0txlVUzFCipdhotET6ab4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803007; c=relaxed/simple;
	bh=Ey3C5ltxxahekfZEQjfCc2Hzb4tG4W9OD2TFDN05h48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7kPh6SQCkAFadVkE6efzhka4eRbvPk1+DqQ6gdC7bfBkF4Y5KB42+m4rlGXjozkvjJaQW6C3RdOxWX732WEbHFBhYa+iZU8mouT+lciUOewdIptzkh+9U3/B98IWg5cQl02Zvq9FkZPxSrExHlOtoeGIeUOzl09f1iCg/JjvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ifeJ931X; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ifeJ931X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M9E67MlECPOOCpV/gwTBMOQGB9keeznuGRJ9mv9Izh8=; b=ifeJ931XmNG5KO72ryz1eN8N+3
	V+aXBGcYbt/bK31M/e3lCnMFl2oYJNYfKJeWP+CLnXUjAOMPMPGG5ntM22aa3KGgneqGejasbAzrT
	WpbztZZn6qAaDaNkQCZHTo9+jOs4VEHFbG0d3VUaGjZCEmdh5nA1o4l2ardqeHi4BmFPYHoLKOn9Q
	K2tZbhWDMOlrdUDWFStxYdAs0ByxUBgqWcXY+VJGQ7D0Eniv+GtkBH5ZwYo8ThcfuKX4NTw+BgURI
	MeMVU4d4suFSqnqbQqWHLP9sUpUwZp3W7mh5xTwFWVcU6+vT2PjehYPUznvq5wrRQN/zi2t3KO5Qu
	xwbL+v8A==;
Received: from 201-27-167-220.dsl.telesp.net.br ([201.27.167.220] helo=[192.168.15.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wFHcq-0025M2-9l; Tue, 21 Apr 2026 22:23:16 +0200
Message-ID: <fdba7581-72b2-791e-c21b-e629d7b86457@igalia.com>
Date: Tue, 21 Apr 2026 17:23:08 -0300
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
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>, Umang Jain <uajain@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260421192214.77819-1-gpiccoli@igalia.com>
 <e27dfa2e-ebe9-4cc4-a2ab-6f1f8140bbdc@collabora.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <e27dfa2e-ebe9-4cc4-a2ab-6f1f8140bbdc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>  #define acp_get_drvdata(card) ((struct acp_card_drvdata *)(card)->drvdata)
>>  
>> +/* List of DMI quirks - check acp-mach-common.c for usage. */
>> +#define TDM_MODE_ENABLE 1
>> +#define REMAP_DMIC_BT 2
> 
> Since the list of quirks may grow over time, it might be worth differentiating
> these macros from the common ones — either by adding a `QUIRK_` prefix (or
> similar), or better yet, turning them into an enum?!
> 
> Regardless,
> 
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Hi Cristian! Thanks for the suggestion, I'm OK either way, let's see
what maintainers prefer and I can easily spin a V2 with such change.
Cheers,


Guilherme
