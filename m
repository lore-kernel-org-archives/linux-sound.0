Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C6237C11C
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133952; cv=pass; b=p5eOk3RxDg2lGklZ02AD9zyPJUw3jnZtIO8IBfo3MLsMIq0NPaFKiOQ8TpDSczj88Izrn+1vKzspoWe29TBk96GpNJr8HjcEzHvvDQE4xMd7jq6uHL5UHJYbQLL6jnWe6UNmzNsoDJp88wdTYONN3ZWKCbbmc9yUvHBQsumb0vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133952; c=relaxed/simple;
	bh=QpmNrPox1cx9v/eeyLsiDiMA/mzJJAUMJ7qlgGkDrmQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Phgvr5bemR1ZoQj+A7hBkGje80MSvhScSziKpL686Bw0HMdOdfgI3CvyndP52DrhOK35D5FPzaE+v8+UKCwJqvOHP/0TGcNYG8FpsLJur0o4i8adVB20cSeaz5UK+aRYr00j9rhxnYcsc+Mnrt3TDj4qwTts3zOfOr2nzRoD8OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp3Fx8VV; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp3Fx8VV"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso512830eec.0
        for <linux-sound@vger.kernel.org>; Sun, 04 Oct 2026 10:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791133950; cv=none;
        d=google.com; s=arc-20260327;
        b=j2A2eM5nyOCra5kUg+998UtILuYaT9FzlX4UFzTEJzCfAbxSednWoddmIO5qmJnFN6
         PSRidl99t57DQd4HfQ/aQrbOHITxxti0xtVOB9zwMSehSS6wM4A9yNp2vfOxq6wLEY8q
         xGpqiXOEyqqxQ4I5INhT8ePDmloy5N9AI5yY9z/m5+VvneOb+4xiIaGIeEBeZXVkN5vw
         Y1jT4UDL9SMZSajl1A6I1+Ljlz9DICI8MRVzZ5ArjGGGYfrtPS9svvbAT+JDJxNWo7mZ
         Q5+Of0M3cuQankfsIYrn47XRRClxZBsvoxkZfPrH/tfMDvjuOxkVZ4JjTnJPXcHEQVxZ
         b9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qPjA4MaS5D9A5etJvCl6UABINO0wyFUn1YzOX7EWNHE=;
        fh=PtB8OU/LpWQYpeyu51CFGa44ywL9TehDVnkYj6FWZAw=;
        b=r8LaEV3KAGmoBN0JFVcOB3BrzNo+eVUgBG3G8E4xqjDyB8ssFuVnuigvNefg6AAhZR
         RU4y4B8wKiV9uUG41zo1gZ+Cl5JYnAVlqabArxON1y+c7aLUPdYcNR1AcHJbpVlfgE92
         Gw4UAKEbsenQS5iFoAHfURhOVNigr9kiy5kiqRiM3hDAoao1JQtvbmaCZqQ4r0ANNVhm
         5uxlP/odhcfr7qicSiP5MtvLVrNp8aGT55rL8c8+y6jrFkXCJnGSfNW8Oi+qOzK0l0Hx
         rYBXF4KI8YwD1hRuqVnuDvrorkE/fq3OkW2GLs/XI4RYZMrMzoFz+iEq4qIKhGpTm7n/
         QPmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791133950; x=1791738750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPjA4MaS5D9A5etJvCl6UABINO0wyFUn1YzOX7EWNHE=;
        b=Pp3Fx8VVAXyAJ7LowmmarpONGVF+DkVd2ybDjIUsn5JM3JXIp1CMZ453ULClm0aB0C
         mduNTjGNFLhCBZc3HB1Z0ZPBmkqJVqKmClsgtNaRdGOT4OzkUuAt6sZCoNiztTLQLesE
         cfpPiOrpOSEEIcWWOFr2coa5E+YSHf4V//pvvIoUvgJaXAE69sNNJ64OPfPCGYjh8BvO
         71LVFiaaLKS1t+mzuc6naqVxuLsYtfvC/Im7w1hFZ3jfcXMT5lDiWU1tt9UcvqgsLRjB
         1E7lXMfx9TB/UxZL8AGeoQSLRKH0VWWSJ79AZrWeWK99EmHKbIBb3cUSOu2rxbPiVh2f
         rCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133950; x=1791738750;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qPjA4MaS5D9A5etJvCl6UABINO0wyFUn1YzOX7EWNHE=;
        b=E5ySc+9DqxKxqKCP1NOX6GVIzYd3EUWOi6USLCQFdA87wNoEA1PC1ZclFsH0kVEOqR
         pCxwiDBbUtzcpl23R0Xdy2PzD0T7da+Bm8CLRO+Mct8ZFUNEy8U0t3Wn93EuuDZKNARn
         uSYF6ZA6d2LALlfIHXqsWlFaGZ3eVskOxXt+lOj48nimOJFtiFZaBxketUHtrKhhT+Nw
         MNNI6ElsoWDF+lLg2HGhy9BGRPC4J5IoOcSuMaD6SD+c6vZtdPJGtN9u6m2tScCWOCE1
         GwBUiSlPg95QcGnwoyFPujPXrBMJNaMmlYbB4ydu/ysY98R2+59zidpf+jWl+dnC+sJM
         noIA==
X-Gm-Message-State: AFq9FYLhBo1QYuQgt7S0LO94kEFwUsb3sPwwEhUzyPjD2neGqxZJ6KYO
	MHKDmc3dud5Z9XKaciNHJJphXNZHITR6WiiK8rFyM4VQRfUK03SC3FfBY9E747cyEdG4VML9+LI
	6Zz/3Pwjdf3HvvwP9OSesliMPjgJUzEopsZarSWM=
X-Gm-Gg: AYBFou3UEu+2rvhFO4XA1A3XBg4vI7pdRZaiEzbDikIp5HcB8ljFxiCd47dWnguReuB
	iFG7JNJCJu+63WOq0gHBUzuR1MXAdxH3655A3j8eby16VU9Eh/TvhL5u+0NcQpOI4DhIZJXx1Hj
	O8Ok9sVjlWw7kk0toda+JXdsPNLMA+YxKFyH7thX+YKTri9wdXQOgwk/ANu24kgEuWmuEe1Vkuk
	KxgCZFFdURrm2J2IEI8KtRghh+S/spHh2dt5gqQ086gAkbOkqkKtLtNNY9Bizr4XyO4jHT7qR6y
	zU6iSaLGVH1XSyKT5cnsXMJKjajXFuCxLg7aQDgOuX46gSPAixxVz+k=
X-Received: by 2002:a05:7301:fd10:b0:341:8ee2:6f76 with SMTP id
 5a478bee46e88-34f21999efemr9990151eec.33.1791133949836; Sun, 04 Oct 2026
 10:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?David_M=C3=A1rquez?= <davidmarquezfernandez@gmail.com>
Date: Sun, 4 Oct 2026 18:12:16 +0100
X-Gm-Features: AclHuK9N6R9D8LDel51A-7xwF7kTzjXyK2JYRxcKCIgA5AjK89kuM7dPyK9dnwM
Message-ID: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
Subject: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
To: linux-sound@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org, broonie@kernel.org, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

Resending this report in plain text: my first attempt was rejected by
vger because it contained an HTML part. Sorry for any duplicate.

I am a user of an Adreamer Leobook 13 laptop (Intel Gemini Lake, ES8336
codec on SSP2, board name PN1308P) running Linux Mint 22 with the Ubuntu
kernel 6.8.0-139-generic (based on v6.8), SOF firmware sof-glk.ri 2.2.0,
topology sof-glk-es8336-ssp2.tplg, PipeWire 1.0.5, WirePlumber 0.4.17.

Problem
-------
The speaker randomly goes silent, typically when a browser stops and
restarts playback (for example YouTube ad transitions). While it is
silent the PCM is RUNNING and hw_ptr advances at 48 kHz, PipeWire reports
no errors, the ALSA mixer is unchanged and nothing is logged in dmesg.
Toggling "Speaker Switch" off and on restores the sound without closing
the PCM. Before I worked around it, this happened 15 times in about 10
hours of use on one day.

Evidence
--------
I captured the full DAPM debugfs tree, the ES8336 regmap registers and
/sys/kernel/debug/gpio in the broken and in the working state. Everything
is identical (including "Speaker Power: On" and "Speaker: On") except the
speaker enable GPIO:

  broken:   gpio-541 (speakers-enable) out lo ACTIVE LOW
  working:  gpio-541 (speakers-enable) out hi ACTIVE LOW

Setting pmdown_time to 0 on the codec and BE links did not prevent it.

Analysis
--------
In sound/soc/intel/boards/sof_es8336.c, sof_8336_trigger() drives the
speaker GPIO to the "off" level on PAUSE_PUSH, SUSPEND and STOP without
updating priv->speaker_en, while START, PAUSE_RELEASE and RESUME do
nothing. The GPIO is only restored by sof_es8316_speaker_power_event()
when DAPM actually powers the "Speaker Power" supply down and up again.
If the stream is stopped and started again without that full power
cycle, nothing re-enables the amplifier: the GPIO stays off while DAPM
still considers the speaker on. I have not determined which exact path
triggers it on my machine (pause/resume, xrun recovery, or a restart
within pmdown_time).

Proposed change (sketch, not a formal patch)
--------------------------------------------
Re-enable the amplifier on resume when the driver believes it is on:

case SNDRV_PCM_TRIGGER_START:
case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
case SNDRV_PCM_TRIGGER_RESUME:
+ if (substream->stream == 0 && priv->speaker_en == false)
+ schedule_delayed_work(&priv->pcm_pop_work,
+      msecs_to_jiffies(70));
break;

Result
------
I tested this change (with an extra dev_info message to count the
occurrences) on 6.8.0-139, built out-of-tree as a replacement for the
module. In about 42 hours of YouTube and Netflix use it caught and fixed
the condition 6 times, with no audible dropouts and no interventions
from a userspace watchdog that I kept running as a safety net. Before
loading the patched module, the same watchdog had to intervene 15 times
in about 10 hours on one day.

From reading a recent mainline tree, sof_8336_trigger() looks unchanged
there, but I have not tested mainline. I am happy to test other
proposals, to provide the full debugfs dumps, or to turn this into a
formal patch if the approach looks acceptable.

Thank you,
David Marquez Fernandez
