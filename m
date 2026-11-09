Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239936;
	b=n5JWqw6NCF1AiQOJwhp9+iR4BS+K8QAvV1wXq+tehJ/lAVQRTlfUS7YhZTs7c9hZbj+Y
	 ov3xwwkpieNd1fD3xyhK/fXt3Paxt4+5ny4XMTvDZDKf2fRrZueFGT52jos0LsJtaDbXc
	 LDq3dJ20NN9aV7MmQ0G9Ve1WB5GtqXw2kpBqQgcaeO0qf5EalXsjEJAQIYAq5z5nfPH9R
	 +xZF0MuUMpog54EwtFbg7Nc3+T0ty20+xTmRm0yO6DpPRksTXcVh8bTfZzwqBuCdwz4tU
	 HnAH0rZg7wsZAAOBRmb4tyR03bQLLpF/yeTqkmwrw3TMhXFaEh+BkXYqaw+0/AKnPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
	b=qjFOGJ3XdUA0E2orcjTlQPzYccLuX1fUSXgh5uTeUClgLf+hjTND2odhGZGLkLY9B/hC
	 t91db/u+VxuCVuir8PvfK7tbOnQm885rkTqqA9W+JrTALYJKRtAcyyAJo1hYFQmnBo7Sc
	 Q1CbD6tZBSMrkXZScPlriuyuPaAg5Q9J8p9vKjTAvqi9qnSgO9TJ9h0LRvB+cSTbIyXr7
	 gMuK8xamjmdJz1sKckBjWV5/q+Guci0pGwqtCPzaclFLm5Sk4QN7JMA5WfC6wjnr0Gjw9
	 DWPI9DOHZtMqX6mbCfT71pcjwFZd4pFxdWTq7Mr4nkJtv86LhCGybLvKVVmT2VHG0hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuJBqQJp;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB95606EE90
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB95606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuJBqQJp
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1712395eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239935; x=1794844735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
        b=xuJBqQJppdiLhxluGyVMS+U7NscRuAVyhpmgJZhCjQisPImrNGSZ6oD6zvOf0FuXDv
         cZBstsXGEPoWZms5AhM3aMVlHhj8rt2OL6cg/nT/zngTkelyGcu/NHafk4Mn/mBdBlqU
         49zCCC6c/lFPDL6Hd5y79dDGrM5ILuiOaTkepEh/1CXQlh9bxy9RsFtosG6eujrLdoyU
         btNbZD5CtQ2Ft2uBiQTzKP1zCEA3Slvi1XObd3TKcdq+dfhfte3Ux4qy+fBBvqtKehKi
         3bAf3k66j+217uc6I7tmPI0x0HUOVi2hMuNnvX+o9cMc7n4CQz7YxoMT9uSWD3WQg4Sp
         VPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239935; x=1794844735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
        b=M7jDhLj0tJNAqbjzXKfrUR4D1VVFkhi6NHOq1qeuMVKvQ9wzqwR/jD0q43H4jOYxFL
         CobTTS/P25Qie0UzJ+vYqzMt0gp37mWBbCZAQcDACLbTpC43lhAiJeqCJ7nlHJZ125cu
         LL5YwvhYw2lWBaO8U+TCKYD/vhX4cRKInoMRawElG7tqnmuKfORfAPEqGnNv1d4yqYaz
         3IUvNgS9que2JD5Pv7eifGeqb7vz+4heQM/NPdbxDI+6q5sKs253MMgjBlWoAl2enzUy
         bU47h/RcpgDFTw1+1XTJi2W+bQX9jfAIrP3JD3jSyBz9Y2PumCjLFbyJRs9EioB2Zfiq
         3zuA==
X-Forwarded-Encrypted: i=1; AL+hErGIpCLyzOWNQ4Prm0fACU9AVMdtnveYsUc5FAYAnfMkqHpcbAu4bDHDZ9BOV5lz07o7j6SfqNPkG7u+uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iTw7r/QpvvzxthPfY3o3DMn0mN06RvARYlSscqQMVKxatv7/L
	kkR+CxXl5fWpGVLjH01CUsluFUGPe1atzS7CK66k8HKG5e8FVYnqCtV9YSMLN+Zj
X-Gm-Gg: AYBFou3punG1X0Pkn9T3I0daRs53psRX/AjtNQdcMKN51prLzgWj9yd5VRLmwlKqbW5
	hM0+CmMPo3HeswYqvonImRDLf+vuuGWeHA2pYIEnbzPRgpYNn8VX2UozCnrkwBtQ8buq/M9IYth
	MrTGG3bw3buDKya4i7ZDVvo7ttd0aHRBRUf4SrpgFjalZMmDd1zop8k+QquLXHroYKzshL9BsLr
	yYKNREYa7gYhiRDgKHqED+AUYyIGtHcU6SbmLO0icHyd8la2En4Wx9KfgaZoZGtIoXWlUNCNpbC
	24uRxL6PwpEPXhijpdOSc3u7NF0ltHaF2X6gBfWCGdVCLdKJNLkJ2GIyYs4Cy3ZnvfPe5SYa9ju
	fh54OprXPZyN0oUHgByjeckD8KKKTGvT9OMSArBhBYtmpzTDw15iHXbu4PwECW2tVyXcKCuKJCx
	1KGNAfo4v4Qf/yyikobzl3Af/crYI5hurrZHwo0yhJHDBUECIwb9VrOdPjW8B0bN29oSIVkvk+J
	2m/aGAn4G27/1m1KzZ7VUHHIFhGceCZdY9ok7UT/FEbVvUypzRKJE810401/ztUIR/jxipJj+0d
	CK8aF6kCkKgRTD0bhEomX3S2/vF24Uq8zcR7RzDYupEJGljhfg==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-372571d9ac9mr8144387eec.26.1794239933856;
        Mon, 09 Nov 2026 07:58:53 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-373920a0219sm9009881eec.9.2026.11.09.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:58:53 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 15:58:31 +0000
Message-ID: <20261109155831.5822-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzguulaf.wl-tiwai@suse.de>
References: <87qzguulaf.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the suggestion.

I've updated the patch accordingly. All parse_*() functions 
now return the end of the current substring, leaving comma 
handling to set_led_id().

I've also updated parse_uint() to temporarily terminate the 
numeric substring before calling kstrtouint().

Please find the updated v4 patch.

Thanks,
Sreeraj
