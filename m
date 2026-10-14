Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D64C33E1
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977584; cv=pass; b=YjQDtDUyB6rHh1edhmHCxEcH/GKohRx/NHp1+BtkvfrjeB/F96GbNLFY/KP19RF8uvUUj21kdULBTCNkGgLyLxr+fctn9LuexQgSxhGnDfxX8fYs8zKq3AzlWzQWf1UZxac+59vSyOcXhztrPTC1A8pIwTjw4fgAOYAn6bFCpwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977584; c=relaxed/simple;
	bh=12GPgwdr3qj0TkfPxuB7Od/agzSF8FGX9L8FNnB9lOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJm0gcU2DjYLvt1oNH9+/0Z2tuIbaDQR32BBk2K97MW6hiVAC3fv7kQWsvnQ5GOnEYAAaVAtpfJaRJOFGaxRzt8d1fhKxT47lR1rLXf7oSZL2o+EgJZaCgqfznTCwfKfPiFD+4Xmd0gvGTMZ7BQdVY1BG2nQ+L+CPIAyuUe7lg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsJJ5IHJ; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsJJ5IHJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so18803815ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977582; cv=none;
        d=google.com; s=arc-20260327;
        b=QDkjk7v0646DZ2VFjbqSsAcNCjY1GLTctMLjJR0rYt6jg9KwrFoNrzPKE5wMnxWneK
         8Od8CowzD+87fbAQO8T3vwN3bTAYtUmcM6dg6yTMOdPcXl2TKV1eyAeKb7XfxFRNSKX9
         v8P8iDEUuIL8iTzWQg+jh2eWwqBmtl5BLcvPoLkVL9L0CPNa7ir3z4p411Z6iTNP5nfs
         ff88MWa4gPy2DfdA02Zta6cT3y/0ifLpVr3JZjFLvWn8xpIWROl0IT/B2hHeqMerxLMI
         LSJK4Klv205SPFvVRiOVU4EUJOAXzXvHy+pDhc8BaICX/TyBuT3riY84KTe+3Q2/tSA7
         hbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        fh=9wNSgCe/iutKv9LK/5kMei4m8uv8jXqiSp6wioX2d84=;
        b=YsjRsPlVu047F0TeIou/XF34njeO7XZoB1tMjG4KwwOv+AyOtw8xGJpQq50Ti/sFhx
         WUQGG9xd3TcRaINRI0z/OBAk2wAiL6BssC4hS3NGBN5oIik4xjr6ZVrTLpjcLhFDJipG
         +0fzY5s/U7wwUOR714elNERM4KAilSKPbdTmDMrQBDDLBkBpv3qHoFcQHvDSq9yo60Mk
         r+1mejisvyuzsuh685ESj16KI4V/FM79MbjpLP8TSOK5JiCas9UbZNYrLfxZ7K9EAZZx
         jGeK5pGpUQF4KPwdro6pSctbucgFgtepaOYFWPNWidaXt+dTJrdn/3cvFNQ7k47OjTUI
         zu/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977582; x=1792582382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=SsJJ5IHJVvYN3OqMbEyzvONiRhLOUCwcl59EpepImMqFowX1Ubj7WQSQSVdF6u+qp1
         M980aG7tYdA1267LECI4iGH2W0g+0l3rOs08S9wsoZhPdaTxL/NPO2DNKu3wdYXQQ4q2
         vbvPWuV9ATvNqO8iOyUs/r0an+LBAzC2Ic2a91Qr6v86oTLPShbOp4Pu4fwAS1HuvYTS
         j+g75Gq8Bkjf790xF6PHZv7ME1sLO6G0aVusA0z0pvgsU0vIfcWQYbIoPVaTfvfmyz9S
         XBy3gpz1cdFoAVKZcEgQXRj2/IUIKIrTxHAOPn2corJb0m6UfkjbXTay1IC2bPQDt8w2
         5h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977582; x=1792582382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=IaJTskL7TD3yv256HGwafVxjtTCS/4N7X+ymBFSHt5DOv7kKLmcFzNU213aEYnDkr1
         Ls5b0YGoJ8p18YcGBn1b4DTSPW2p7pJRSfHxAPZOtmV19anvLxOJzsY5XstFTtVBgBMd
         3sHP9Fygeo4X+A1zDXERYxD6NVkT+hfGVAz+PadoWKYAbqlvkMq1ycIFX9QvubDmTykN
         rfQ1z2XPXNzgdXpeAHaQhrIOZ6yf0gQJVU/rVYYMpqs2SUfQVe8KJ1JVit4zjLhwydU7
         /drsDT1ZwSg4q4Gxk9dNqE9pQ4grqm1tljIqN6Y4BJJBqaekpR+cY8vd89IyxYjkjv+Z
         NPrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMwoilBHFgWW4ThHxSxkBFF4njAY5SapkSQ/ahQHw7XIWkg6MeIObSg4rGEFVl/lI5azaDXKSI3E2nYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIh69j+X162rRqlS3BkIO+3dqX6olragjuaNDPp0FC7F3f2M7z4
	Oxq4/mymif34AEjxn8DClOfCneW9tLpTELbhPTw4KL8FUSjYgKLLj7M+ErBCb1dbFhn01br9uc7
	8XIbmk0jR2pU7LC3u2aBVZCig8kSKEAc=
X-Gm-Gg: AYBFou2n0B+Vduyh+TB0tO1TYimVS9n/N9/nGq+Farl4ybKFq7fx/oY8WGj44ap4rPe
	c04L5Ouc71zQIHiP9LS2DsRS3NVgheO2DeHG296Y0IygxZUwakJQ66rvXKd7YfBBMZX4aVA+BSB
	P2duvU6+7Vu6HK9oectazcgCiUOOR8e7wwG8Dv7UWwDxhLWmzc3nV4jX0AS9bs+hM8NeEhkXmDj
	8/eIhu4Kiro6b20agEg1N7YOkV8VzkBP8bBfRjbM0vNvqP7dmONbLmFpUKlihWZxWKDZ+Cbr+o6
	e7uMi5976nHO7rNLs+3L8qwEEXNt6FQNZMqA1rFSx0hWO+vOe1faSO5V69S5HBIAXT0ApwDEpXe
	DEOzk+mH8MwNJhN/6SZzonq4+CoM/16Pvrd9NASuqoiq0OqqLczHMAR41zhQjoNVCzhA=
X-Received: by 2002:a17:903:1b63:b0:2e7:ff72:203f with SMTP id
 d9443c01a7336-2e842bd0f74mr119079465ad.61.1791977581942; Wed, 14 Oct 2026
 04:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <179192410143.1606900.17860222773161459120.b4-ty@b4>
In-Reply-To: <179192410143.1606900.17860222773161459120.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:32:50 +0700
X-Gm-Features: AclHuK_s2zGX3VihBvP-h606hGOl6LIyL74TJwbiVFCd2fpUtb4C574mAt5YBhc
Message-ID: <CAABR9nHZ2+AD=-SoAbXSuCMD4UU3VVEQJNEF4w57Z_c6Q1a5vA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Tuo Li <islituo@gmail.com>, Rosen Penev <rosenp@gmail.com>, 
	Garlic Tseng <garlic.tseng@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
>

it looks like v2 has already been applied, hasn't it?

https://lore.kernel.org/all/179138999054.2423942.10212092263791353501.b4-ty@b4/

Best regards,
Phuc
