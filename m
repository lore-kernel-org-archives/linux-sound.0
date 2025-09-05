Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3D2DF71F
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063873; cv=none; b=IBDUz/IJDtL9eyL8BKX7Lzvc7WHYG8OCYvcLSeSVKP5vedoSSnltqXFzGROCXCb5cpNH/i4sY81qH731SnUXt9D/Nd/Oaiz6GRoRkZHg7iq1D3R0EH9R7TPHzW9HHTD5WEocyaMA1xBsCQ3kAxw4X1PDisZt6JCLQebJ8tjZO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063873; c=relaxed/simple;
	bh=HtCixh7So8A8SMkZfbaqBqooWI8/h+PC2ysjtTjTdHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZhOLTVoCI8EMMfOB4YcUheNiFuiF3vB/VY1ZLace284P2V81I94wUICPpYWs/s6EkRlJoeYfMA9pbm5NtyGc6VKVXvpBoDro42mMWMkgkp7Iqw4shGzJaFL3Jok0GaNEcZ8EEaFHOal7AtHSp/UsTOllEcQgkxQJuOa50+4uto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElP1XsUJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElP1XsUJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445806e03cso25910315ad.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063871; x=1757668671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=ElP1XsUJF91WNBUDleqgVI+uuR7WzOBEIVoKx0IP/+mbpQrrgCF+2bfTkkea7HBBzB
         DddQ8GQwvdkTJVAj9pIEEVcWzo15/h/UksavVYJc9JnHrRaz0bxE9Mw0lMUzWPJP43P1
         z7gVnMnVB1k0cS6fLUl04vIdF3v6ppMzLQHlDKzqIEQ0Oj+BpHQvyjTajI91P6eBHKHx
         U6tZDXOGq0rNMzeYqNpFNiRgKoDeIFgsyciiGYt+0v6xAlJSzKrf2+A3PyxNRRwOstlJ
         C5N/sQePaiHBvSmLxJxFNvNOo7NeMWhg2Lx40tve0R5z58i9F0s7yh66mD8byEaSfxLd
         u/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063871; x=1757668671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=bggmyHJj9pYU3Ql/3gXmMHQWCI5xD+xXZIDOBk2iQBk2dxjrRvJxtXWFiunBXxCCpP
         XVU0Sz3AZISxkRvBBhArE4x+p9nQWo4+yl7f+7+8G1IwqEApsn7Cz1mHxQ6oEod17sOh
         FCaSsUx9Ogm3WDckbchAouHIpsbdU5rxnj9uZWF9IVDUzN9zRLtUbLyMfuYbZ1X+Vg1H
         yUgqt4SU6gy1VCNivwT95kqPRZ4YSlGMtzCXoedyl4Fbsqgq8jc8HJpG62DIdp4mfMxy
         IfsvjgefggKIfdJG84eASavansz+kB1kBCzg0tKYk8fa2gTiS/+KCERsIbcaxWCQ4DDh
         8PQg==
X-Forwarded-Encrypted: i=1; AJvYcCXoipwNmXmiCtK2eI1t3YuHvZdn78gQJ2hd+NItKJLzw36/jIRDPZQTKAsoApk4V6SwaiYyQJ/FAxcD3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RLGJ4FMn9tNtsMSWwerIVrteWurMxLjWNum1677XzffauQb9
	VseFJlO5S6wLUergv/935tjzkUMSOlDbsOgRyGZcX1M6pmF6f7DnT18yZ/p4Gdiefw8ARwK+Djh
	Yz9xfO9xz+wS2OGqJdsGb1Y15MuMTwY4qzIwXjj9Y
X-Gm-Gg: ASbGncueIHRhR4Arv+dGrs+3fhnzrPOHt6q9hfln7ZXP1EdfEVpqkDn/Z52c8FtvOWr
	bvzuAQCCgvp3p+JkChsfYCxhu50f+pRPuJVlrnra0tH6AYUa69Y63kDSFjSDiilt/+WEdsH2x+X
	5sNRy1qMRdoX1Bir40oYASntD4KK+8QuCC3XxiDzHZkAJHvRaJvekZ6h1loPqDlKe79FKK9uP6i
	aiPTXXB30kgXd7ePggljSakgEOKyBLTEr5ceaetLUXnR9f5k42wa74SVQ==
X-Google-Smtp-Source: AGHT+IF9S6iUUusneiZYRAF8ubXHonr/3eNJ3dxl0xbw7JyDRWMcPsctZ7caRsOI3KB+wShmBqhQXJYDFiofBVvADxw=
X-Received: by 2002:a17:903:3d0f:b0:24c:c8d1:2bec with SMTP id
 d9443c01a7336-24cc8d12d26mr73181375ad.40.1757063871035; Fri, 05 Sep 2025
 02:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com> <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de> <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
 <aKQGuPgwXE-Unzeq@vaman> <87bjo96t2k.wl-tiwai@suse.de>
In-Reply-To: <87bjo96t2k.wl-tiwai@suse.de>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 5 Sep 2025 10:17:24 +0100
X-Gm-Features: Ac12FXyMMz2kHiEopHVWkiVekeij32ZuBn5pZ91dcPOnuZoD_YGrtaq5a00yJT4
Message-ID: <CAAntYmLGiqfZDKi2ndB7vk1GGZ7=FdozFvUFtMsKhVf0AxdsCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64
 ioctl
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vkoul@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 08:18, Takashi Iwai <tiwai@suse.de> wrote:
> OK, Joris, could you submit v5 with correction of what Vinod
> suggested in reviews?

Submitted v5 with revert of the alignment change. I think that was the
only remaining open item.

Thanks,
  George (Joris)
