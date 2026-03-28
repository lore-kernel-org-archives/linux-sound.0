Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1414A318ED9
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774723911; cv=none; b=Yj8+FiB3++lPU4bq5nJQ9yL+rQvB2GDUTKTXMSJeFV5TIcTpLGOFiCX5qG80w128w45rTassU1M+WDKL4mTMILfZJHltBYB9RCuy55e9f8nGfweEkJHOdPdtiqGN8/HHtQ/PCmoGql2kiEsocAjbyaaEZnM8XPe84JsHKE3z7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774723911; c=relaxed/simple;
	bh=YIOw8zkwh8qMbV1d1g3sisE1mYIS+ZOq3WYjkx8c2/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b11cUdScDVb3DU7GcgOWRqwPghM6WM4chRH6yeXZ08GA/VQT5BBB4VKWUpqwSOwstu48HmAWXU2Zkf0NTpzfTrHwKuKkcII9zI7uKRaTeSdTsMnCze61U5Xetpzm0uk3THwNPHyHSQd+b079sw/1jaeQE9fugy5ZWp2mkVPTkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tITgBjbG; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tITgBjbG"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so6144279eec.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 11:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774723909; x=1775328709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wM9yWpPgGuuPeaOmOysNRG/cX5wsJ+uRa9z8S9ikoAU=;
        b=tITgBjbGXToA8A5wL9KQvJiA92hQpWYKiJ2mgyhwW11pXbkmZiiJ5lCmlTXxr7ST6z
         TkMqn/g96SWSINeHSsZFtZDPe7IQIjF9OBMCOctQOtW7wAxapeX6ayXzPbdXWE3FdiU/
         9AuX3d9L8fzbsE7RGHeI9QqISlCoDQ/Hzwa+HydxX7NzSipDNj81M96ctjIlY4u0tqUO
         1FhEtuISEexnIaicQzebjY8T5ZcbKtJjfKhkD3LpQClQ8Gspaqbbanzb7IZTQL3xOeZ4
         R+62S5cx7r4O3bYHClRWEmFMmPq8kyhOmEweg4FFkSYsV78chwiw2ShmS/SSNmt1OECJ
         ymyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774723909; x=1775328709;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wM9yWpPgGuuPeaOmOysNRG/cX5wsJ+uRa9z8S9ikoAU=;
        b=fdTufEupeeWFbpZiiq3dqxHBTs6oUwvVAqb8KKuCN4KKkW/5NwK8LElkqtiil52Axc
         w/GpVS/Fnb3DlB8TKo800YkuSgc0OHR2JiPlFuY8ZZmXPVbrxb/TMtIM+b1GM0K/D2u/
         sEvsW7zq1Kxva5V071yybtkr6Cz/UJpTH0uADcniHvXX+pH/g1KTBCsHKHPIq9kRjCL+
         R0l1kAcOIpp1tkm/optbgcESin1LmigI5SbNtu+EYcR9urLZlWXXq/u8aQRCyYQjLGMh
         ztCUGT/103yNpq22JxdhzG+qBS08C6ZxY+nZuN0KirK8sr9r8PzFbvwgRmobS9HJUtc2
         w8pg==
X-Forwarded-Encrypted: i=1; AJvYcCWnvk79K/aeaNh0plJ0ygRX2Eoocrllcfs9a9If8fBsJ2Rbs9/OT1W1Ju/N3pQt8pCuuywaVPVrbovecA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eYg27TSgR7rP3UEcwIcjzkOCtRfBRs4WPZp5L68YVJOlDROK
	cRmZ02TB/opYAcuDv/7uzF5j/BETf0H6KGwg5JcT/jhrIOJ66ikdqyj8
X-Gm-Gg: ATEYQzwyQ5XUucs0RVAWyaRYuoZwS066D/0F74SrHf84lA1OlpV8s4Wd/t3FGBNXHDD
	UAAx1dKYAhH0xuUT8TvMFxquPRkAmjxG8e5dYkd5RWRVaTjJ5nTyHvzfYC2SVEMIRn9Z0DJo5/k
	gyNGuU/jpim6exBumg03s0JqsMETfwGh+H5ym7BCM7fK/nmlGUxpcMCbc19zDCBT2uHeeMjzCQe
	/vhuav7gq/sQ8aeyzFr7IJQePslUJ2TtwslmmdcjyRT+jZTda/JAcpNJLZTjlz0r28JGG7G25II
	sokxQNZkEgVd8jRsgcofp1qwAAGGFVeZ6qwTubwUHO8PaHeIsvIeYz2Jvw6sRgppwWo/kNB7tJM
	VqQSHvSWLSdxHY+Q1FLIpW6ktpvey/10qn9ZDgmgvIOFjoxBPOPtaqddnk2Vjt5PXfFDlieItGe
	FLJT10wTo9TGuU8Qh1j4zgXwXs/FDqohtNQxESepGFqwTZhkTDuVTX5DbtaMegwErj+LfqY/QZQ
	w==
X-Received: by 2002:a05:693c:3008:b0:2ba:6b03:909b with SMTP id 5a478bee46e88-2c185efac3bmr3939695eec.19.1774723908934;
        Sat, 28 Mar 2026 11:51:48 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda07asm2589526eec.1.2026.03.28.11.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 11:51:48 -0700 (PDT)
Message-ID: <b1bf534d-cdd6-46c7-ad10-b59cd9508c5c@gmail.com>
Date: Sat, 28 Mar 2026 15:51:44 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/proc: show GPI and GPO state in codec proc
 output
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260328-hda-proc-gpi-gpo-v1-1-fabb36564bee@gmail.com>
 <87tsu0ul2q.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87tsu0ul2q.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/28/26 10:42, Takashi Iwai wrote:
> 
> I noticed that the verbs for setting GPI and GPO are missing.
> Will submit a patch to complete those.
> 
> 
> thanks,
> 
> Takashi

Cool, thank you!

-- 
Cássio

