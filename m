Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100568;
	b=4R0uT1nvrxCf4EP8myKgvGqHcDZk60V35Lxo9Yd1LRudMw/7esJbnPHNFJ67uLlfTfOI
	 072dSDUaheYTusuNsvE4wCCYbk1AeeFY8p+2J/d+HXnzX5/+JZj/ULDzgSjGT/V/N+luE
	 oDM8NgvhWF864YnHlnTYcyUp2eqAHZENsjK3RTEXtmlsacGhwycK3xVX+kcF+9otqy1/L
	 UtlfauVzs9Hh9PNAZ0XZZh7bV3FRIfnBr0l+IheeA6GDhIb+viuPfXHxMatBVs31tHUIt
	 FS8Dak2krfMom9HcKLz5w3tELjzjMnWz5L1C7iOWANtNHFEnbkBUbIJbWwkIBc6HW4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=p02Otrp6xlm6/0wUEIFGu5woLlJFkV+idyuuEsNUBGkcIP358Q8sXTl3Y3GTKG/7yjlw
	 cycGvRVpTfAN/wPrvIwwgrgo3tOJisRkt2LpjmJ096Xn+EyaDWn4GuF9fsSO0fXLyWk6S
	 UogOllYe6fjjaZXoH1HWOsyienMVjOhtoLqUMfDHVGi+HUzN0J1lrvwW+lIoCKpWZIQqg
	 NcqIsOaf+xzyf9iewOAbuKpXTmL+BH+mMMoyfJxHqZ8L0s9T2vnDutJnEkoHvKbe0ddhH
	 bUsp7RDXnn9lwRYRxoUJ/ijQfB0jePuxHnK5iDCRId4Gs1TdGpRs26RCYO1cgMjPMHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oz2nPTHk;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C9606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982C9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oz2nPTHk
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso2362161c88.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100567; x=1795705367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Oz2nPTHktLmcnwc9QD2deglhss/KTTh6sqOt3i2IxfVDH2uZsLDxqArn+5JT2shlwN
         PnnB1juWrf0rQ5RuxUhCYGuTzVH6pCEPT6r1hHpDa8nmYQaXH9l1GlT86Ot3/Lch+RhI
         P6Q0ZsZcA9G9kg9f1vkwokCYZIMSvnfEy6IJNowmsgGZOXbHmNWPu9o6b5oV8JGh2ePw
         xfKYPmKqvORFqIhWEUynLV0QDp1UR2zW7cMidypqiHYXa7ETzUaWYv1JV40nOyBxeXh6
         shAA+RtTnx461Ib6+e+ydoOf32YAMGYqOx84DcAC48LNcbwGEKLy3LFLWoLDdvWzGKKr
         lDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100567; x=1795705367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=QMYMX0FFf/FHi0pl/UkaI/AKXP1W5+BWg2kD1jRoob65YBGpMgXhXNOY2TbF4SKlg0
         NmksdwvC954hPnBjDQtvgJPxTNij3VzF+/gJtkXU58urRHFYsADMnHSx7jOek/jeTqek
         1p6bDuD3/pbv7ja9eko40+tcDaY53JlGNgP7WwfwCLVsbMRsDfXT44sOMRjenowZdF8R
         04BuhhtXeJgFlMhzajty8ZtgT7cUswVybeO07c/BS+nh78iTXddpC9whYTtBR4W4Tdtc
         iXXlR4QHTwSQCCO63d8yTDqUbLjan0ja9BsEM/oYQZn799hwlqnWC7uiEGzyL1OqKXVx
         FoJw==
X-Forwarded-Encrypted: i=1; AL+hErEJonUBbX476OSOveOPquzvaRpU+00kd5vjDTtcqO3D0xYItHkTEqQg5U/2PJPtP1jqPO6D86EF+42QZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uezIlBRPcg2hN2YuZp1pckgcyVyR+Un/ye8CaXEPFPmMkQk45
	pHkP41sXOGn8UnZn2yjLbrnwwuU0/h9VnAsqiAAnGAf+d/KjCsTuR7qb
X-Gm-Gg: AYBFou13Tr6LZibvBFAbFG72O1O/xNIc3TOmGgVmBeSEplvNWZn5z5rzGDCnM7NLI2N
	EhRKMNgXgHA3e/jud+boT1PQmIlS5/E3dKDAqH4sFHuwqvp0IMUz1BVEjYbdM4MXjrWbLXnt2lH
	LEZiTO7WIQbOv7RBwTXnohROV+1yhweIFNhrbh+FsNaxQFxOynl2RN3U0VCsNHhtkALY+/wLtmW
	dcowKyj+kJA/Z9xECvWKwRAA2O29VFZB9UP8C7HFage44GMOV9qMhIc81n7MQoqZRgEvG9gmP81
	MO2NobVCZpraUbP4PB8+I8NnF0JApHsh16XAdng3eD+y3d6aU5L562c8LgNMF30qX364ydGxIcC
	wM1WFT7kyKrtxUh2igUx9cS7WVXTqHZLtOGNWSsPA5PdTdTlqUehaPQpsKDZXarARsoPZc5JPar
	ClCODvZmm68HiGskUfq6TQm7foXiVequeo+rHYJWR8ZBpjrByZWENlnjp9/7tG78hJkr5A6lURS
	pzFm6ow3IvvtvnonHbRo7a28me83SMnicaSeTQEJSChTRftZWqOmieT2VZhH7hbhSWrHc1e27KT
	CxEYEfy3MFR4WDYUcldhcNB+FOEYU11l8h0gHu719biOphEi2ubB
X-Received: by 2002:a05:701b:2051:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b543cf29c7mr5755024c88.31.1795100566769;
        Thu, 19 Nov 2026 07:02:46 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm10457288c88.15.2026.11.19.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:02:46 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 15:02:20 +0000
Message-ID: <20261119150220.3320-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87tslduhiv.wl-tiwai@suse.de>
References: <87tslduhiv.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
