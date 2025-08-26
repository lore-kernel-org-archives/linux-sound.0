Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7CB239072
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200626; cv=none; b=TDgmgT0uevcU3+DZ8NDAzQ5mXWcb+u0m6u6/jC2T4eK0slBRgcmi7dg4X7AAbJlqIFj1QJdX5fQSyJxsO4whBbTSJrgsCw2CLpHudLIFwiJaCgdGPC1a/twvhJOO5Hn0hF6+Ay0vTg4RTc2/q3/s6QmO+kmEX+kBhFxwijGC9IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200626; c=relaxed/simple;
	bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NszEziyNZbe/sx+DVemPavQcBrLRqmbxjL5LY537XjO+82WAWG3vaz1AeMovZyPMMj23N+J+QJajW83MJWL3VT8TxtzfaTopkXK6Oiep4eUXKt/WUlKXvbYD6q0bQSp0XUeyBHIzkwmQg3wdvN0Zjp+fEE2Kpav+vFqJ7dNzuFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s59G+bjG; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s59G+bjG"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70d9eb2e655so44385916d6.0
        for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756200623; x=1756805423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
        b=s59G+bjG7OAUIP7IxnZmYpZYjJKTms7pfu6w86fK4vBe4UlOG1Ia8AKE5fyIHPosZO
         jaqzVRX74rvU0sXuZvt4JunXJ7pyZp7o0ItAndlTBT3ck1VHvcsbZkKT+HNcucUb02I5
         2j6n5tYMhW0YpKPmevylx5+h2R3RFhjXgCPmOiCJkGLlHSVn/icLQx+BgcqkkwGRmxNw
         UPGY9x3hYoWmcoQb4DpV9Olv0B5Yqjgub2TFE12/a/ePtDQUXMGtfm0fH2aCBIdYbkBO
         oIB2Pt6yBvnck1gseO/jTh440WAgWVQWkLKupALx8JRm02gq+1Iz5byzlpnb6ofNQu05
         crsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200623; x=1756805423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
        b=GLLOD0PI3/2iX6LmlSF8/XEQycz5zLOJvh737PqL9YeasVSfuIfZ1c3tMvLautb0T8
         ZqllvxMHTJ7hrtiEvx2eOnL4lADbGxexbOCSs2c6H1CLJawRIgP3CjTOkrwedAKXuCaj
         psdRJrAc9b3QU0wq2XS7fJZnVEy9l3LU52YFHH7oHM6TdoCh7tj/0xYYf6hXmBYyRkfk
         aJSvlL0D/Y9k6q3LIJ66kX5Hb+RXuVea2usTLO1MJA5pQsixIMmXr+Bc7Mmvxlr+Qh5t
         blBcTrOYHjGwg+kNqmeyVBsbKewmQpZKOEuM/kilOoFcb1AN3vapKiNfK7rUcneGQPGK
         swVg==
X-Forwarded-Encrypted: i=1; AJvYcCXkw0EhloCd3Me2Sc38grRyX/u/2J1MXhXP6YNuF864xqZLPaVzgVhnMd18ZJx7rl7uS8LQfbXHS4n1Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9akgXJXdiQlRmw3vzalp8oMTAQt1O4g7awER9gRKEZED1axCz
	67392SonCcwE/W7pAPzBJf0elDgkxMcVgFcqnentnm5aaBITDmMefTUnmtTDRsHDtWnVUlsmsN3
	NVsQeYUokgm5CqtQEu0cj5HFvmnOisfGeU54dGDcW3ueVq5+/alfADeY=
X-Gm-Gg: ASbGncsCi/FCOoMQ2P0qnPyJoDtyXtheeZX9ZjV6ZtxwPgparWSqmWjlgGPlBOxbt2r
	lTOXwFGI2DgCUxmUfthMgMNsUGWQA+XR42aoH+xRf0nL1lFSxm3DlO0iJr69daLM2r0OYPCyw9Q
	mRCP0lLUB8edRe0wxUrfVJcxvbE7qphuPtmJCJm5py63R7HbaWuqIx8nwr/gHRy7NBNo6A+AB7z
	9TjGzE=
X-Google-Smtp-Source: AGHT+IGmb6aCsOOpnEHv9Gpndnk4Vjl+wnb5OY915aQJlI5lgdEYqe5G/1E/Dq637FnnVD91zJaENT6TRFh3PTA48B0=
X-Received: by 2002:a05:6214:2526:b0:70d:b80b:70c0 with SMTP id
 6a1803df08f44-70db80b8896mr80009216d6.51.1756200623362; Tue, 26 Aug 2025
 02:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
 <431d4cbf-281a-4f93-bda4-767fa6b96c8c@linux.intel.com>
In-Reply-To: <431d4cbf-281a-4f93-bda4-767fa6b96c8c@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 26 Aug 2025 17:30:12 +0800
X-Gm-Features: Ac12FXxSXegTC0bZL7M87CxHLjg5Y4MEinlMDORv0H8fnA3ehnPv_o-ljoNpdTU
Message-ID: <CALprXBaatmypSp=AUDjxYec87XRtnEE3vDc-VKsULPA2W5135w@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 5:11=E2=80=AFPM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:

> Can you add these tags and send v2?
> Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
> Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>
> Thank you!
>
Sure, I will follow it. thank you
