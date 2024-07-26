Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E71E176AD3;
	Fri, 26 Jul 2024 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721987052; cv=none; b=XCfC5HtEnsIz+F6kJnShfJGQoN6cqkWgHEI4nTPBbf2PiFwU2ww5Zqwemjnn3lAil2J2fmAYS4V39fN3DpeisnUs70UTDbZtLVqEIJTutzeMAAstWyFYYUaojCWgIS1e+7NDMu/y3kHexvFWc2YRTespt4lPvz8Tlb14rHuDDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721987052; c=relaxed/simple;
	bh=fkWVi5mMVO/eTzCLYDhSOjZPV6iIX6c9LWFmYd358QA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LIWx+0+kAYkhPZyndP7OUNsXI0jR5buX+5tRwZ9ukkE1Z0sFjktH2xDFlRcCyhBAzy+50W9DljsahW+8JOCJLhd0PDI0xbEAb2QqB1LOETXy6kO8ohGEE0YmdR/a5Y7JEB3vAu4tX3RnqFEA/rFh+SjnmJdOLSzVzEJXNVwtFkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lyFbRtQQ; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lyFbRtQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LCU3n
	0xoYfDBIb6QU1pZNQpe9ANC25guwzAnnuTaomY=; b=lyFbRtQQrKHAfhFDzrItZ
	+/wKd/1fQ143pQQ2UGnI4cQy7Rv4twEHFSIK1QNRM+nZP34mQ+pQuSOLq7veoQW3
	oIK/fhGUUNyuvHAbGFuUoLgt2Ybd7kUZvhM+SM1lPi18Ij/A5lCgEGRaxU+i8G1i
	Q5xJu2pusAKCqw5YvlrTBE=
Received: from localhost.localdomain (unknown [111.48.69.245])
	by gzga-smtp-mta-g2-5 (Coremail) with SMTP id _____wD3nzJkb6NmUrEOCA--.17886S2;
	Fri, 26 Jul 2024 17:41:57 +0800 (CST)
From: soxiebing <soxiebing@163.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: conexant: Fix headset auto detect fail in the polling mode
Date: Fri, 26 Jul 2024 17:41:56 +0800
Message-Id: <20240726094156.48571-1-soxiebing@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240726012342.8645-1-soxiebing@163.com>
References: <20240726012342.8645-1-soxiebing@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nzJkb6NmUrEOCA--.17886S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1kArykKFW8uw13JFyUtrb_yoW8XF1DpF
	15W3WrtFsrJayIkayxArZ7Zr12k39ayFZ8XrWFqa43AF1agF4IqFWIqry5AFWfJ3s8KFy2
	va1DKa9Fqw45XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zROo7_UUUUU=
X-CM-SenderInfo: 5vr0xvpelqwqqrwthudrp/1tbiJx4ow2XAm9gpvAABsg

>On Fri, 26 Jul 2024 03:23:42 +0200,
>soxiebing wrote:
>> 
>> From: songxiebing <songxiebing@kylinos.cn>
>> 
>> This patch(7aeb25908648) only handles the unsol_event reporting during
>
>It should be rather "The previous fix (7aeb25908648)".  "This" points
>the very patch you send now :)
>
>> interrupts and does not include the polling mode used to set jackroll_ms,
>> so now we are replacing it with snd_hda_jack_detect_enable_callback.
>> 
>> Fixes: 7aeb25908648 ("Fix headset auto detect fail in cx8070 and SN6140")
>
>Don't drop "ALSA: hda/conexant:" prefix but copy the full subject line.
>
>> Co-developed-by: bo liu <bo.liu@senarytech.com>
>
>Usually Co-developed-by is followed by a Signed-off-by of that
>author.
>
>> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
>
>And, I noticed a typo in the patch that broke the compilation:
>
>> -static void cx_update_headset_mic_vref(struct hda_codec *codec, unsigned int res)
>> +static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_callback *event)
>>  {
>> -	unsigned int phone_present, mic_persent, phone_tag, mic_tag;
>> -	struct conexant_spec *spec = codec->spec;
>> +	unsigned int mic_persent;
>
>... here.
>
>Please make sure that the patch really works before submission.
>Also, run scripts/checkpatch.pl for checking the coding style and the
>patch formalities.
>
Sorry, just a mistake, i ensure that this patch is validated.
>
>
>thanks,
>
>Takashi
--
Thanks,

soxiebing

