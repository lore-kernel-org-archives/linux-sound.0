Received: from mail-m12774.qiye.163.com (mail-m12774.qiye.163.com [115.236.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AE384244
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787018903; cv=none; b=FHm2j1gWtsD1jgbwQyoAtOTtZTJh1jVoGThFOinW4ronS4Z01BWxHM1QfUF8ea0HJ+t4GfEK73/2ZGt+CKHYE7STukQ0McRpBWdSHh9khXfbvmU7O5oDQ97vZqfgLMzCNdN929gUlpYrOIMfcsHH86RB04AG19uooxRim+gffU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787018903; c=relaxed/simple;
	bh=MBySjrSQ/ZBsmeeGoHuQmd4ixsnF+a4i/JSZ20FgY0s=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=gYkM3vt545cPdWOPztH/6SIhIs/Dwd7qb8PiIeWMofToLUb/rnColj+ljNcYO6oRD4u0AGS2lubJpmBo1CF8HM1W/ITfFp1u/g0PX2k8hJteLmRIL70SbR0XZL92/a0EyMuAgkcgxA1B6pxcV7wUJnX2APRGVhBD6gKspHzbi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=C4R84kTZ; arc=none smtp.client-ip=115.236.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="C4R84kTZ"
Received: from Wangqianghua (unknown [119.4.23.72])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a55b8869;
	Tue, 18 Aug 2026 10:03:00 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <20260814025653.5484-1-qianghua.wang@senarytech.com> <20260814025653.5484-2-qianghua.wang@senarytech.com> <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk> <00e501dd2df5$f12bf450$d383dcf0$@senarytech.com> <c4edd65c-d0eb-4b4b-9dc9-3fafee2146aa@sirena.org.uk>
In-Reply-To: <c4edd65c-d0eb-4b4b-9dc9-3fafee2146aa@sirena.org.uk>
Subject: =?gb2312?B?u9i4tDogcmVwbHkgW1BBVENIIHYzIDEvM10gQVNvQzogY29kZWNzOg==?=
	=?gb2312?B?IGFkZCBTTjYyNHggU0RDQSBTb3VuZFdpcmUgZHJpdmVy?=
Date: Tue, 18 Aug 2026 10:02:56 +0800
Message-ID: <011e01dd2eb5$b06b4040$1141c0c0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF0xz4U0tXEInJyRQvS7dIPrhkTTQJBbjqnARid6vwCKMZVlAJ76ZHMtzPmbdA=
Content-Language: zh-cn
X-HM-Tid: 0aa0129b914609d8kunm1349665c61241
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSB8fVkwYGRpPGhlIS0gfGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVT1VJSFVMSVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=C4R84kTZchfx7Ksi5wZNyjEFcJEoemMDW5vUykhJ+msNswwmgdvLUiBrdr3UOE+OaruVR0B/qUCWuclhJLXEMrcxJuYa7IkPJ7D32q3ZVxmC+D4NwfHcEfb6iG04mDmbEfJLPOyWIH8eO/ac70J9FIVLrSgGc4RUeXybRv8QHMg=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=kUFcvmbx/XWY+dyaT4qEPL+cfWXAX6s05X0CsFh3WLU=;
	h=date:mime-version:subject:message-id:from;

Hi Mark:
	Thanks for the note. Understood that v3 was dropped before it landed
in your tree because of the CI build break, so I am sending a full v4 =
resend
rather than further incremental patches on top of v3.
v4 is still based on the same tiwai/sound baseline used for v3 (commit
0414dd7b6f8b, "ALSA: seq: Drop the dead struct snd_seq_event_bounce").
Against that base the series is the previous 3 patches with the =
following
fixes folded into
patch 1/3:
- enable runtime PM from io_init() on first ATTACHED (rt722
  style), instead of enabling it from probe after
  register_component();
- update sdca_asoc_pde_poll_actual_ps() /
  sdca_parse_function() call sites to the current prototypes
  (drop the unused device / SoundWire slave arguments) to
  fix the CI build break.
I also checked that the v4 patches apply cleanly on current tiwai/sound
master tip.
v4 cover + 1/3=A8C3/3 will follow shortly (or are attached / sent in =
this
thread as [PATCH v4 0/3] =A1=AD).

Thanks,
Qianghua Wang

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>
>>>>>
Re: reply [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver

On Mon, Aug 17, 2026 at 11:10:22AM +0800, qianghua.wang@senarytech.com
wrote:

> Incremental patches shortly.

Please send a new version, due to the build break I dropped the patches
before they made it to my tree.

