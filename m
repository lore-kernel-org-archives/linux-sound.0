Received: from smtp.toombs.earth (smtp.toombs.earth [95.217.182.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4022FE06
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.217.182.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791136; cv=none; b=lq4KVJUwjco+R4F6tRrQmUNdZVLW9OmnLnEhrrJrIsItNPuuteErZBlmY7K3EHiMF6v5M2UWBg7jkShw5L0O9sHzHya0bqO67qaXfNDVuCeevxXL+MaMQlpqj8kOIiv+u/u6qvoFkiLaJcEnfvN4quNlQjwQTluGVTNLioVpOXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791136; c=relaxed/simple;
	bh=0j2YoafiXNns+08ThfNXrIJEeiqRY12a+ZbL/YQ3cjA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lavPneHYgEwAg4bxqajYvydsWmc4BeLnYCizFJHK6TWRzo2rxRUhcDvWo2X9GT1BUox/VNDR6zJCGV73nXhiv1vJn3izgzuVMgWgSrAO17aksu6pVXGxslUi+SOn9dh4/R+Z/f3qD5oGq7+1MGJRagBhNUHQ/2+NcMk2nMAncgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toombs.earth; spf=pass smtp.mailfrom=toombs.earth; dkim=pass (2048-bit key) header.d=toombs.earth header.i=@toombs.earth header.b=LR+DNDUr; arc=none smtp.client-ip=95.217.182.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toombs.earth
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toombs.earth
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toombs.earth header.i=@toombs.earth header.b="LR+DNDUr"
Received: by smtp.toombs.earth (Postfix) id E448D14A0288
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toombs.earth;
	s=default; t=1744790596;
	bh=0j2YoafiXNns+08ThfNXrIJEeiqRY12a+ZbL/YQ3cjA=;
	h=Date:From:To:Subject;
	b=LR+DNDUrJpltRmPVQPBzOBUmfBJpNoXl83dTYGyPRqM1oX5XMwCC7Bm5iMPYVorVJ
	 hltWh2cw2NwMmqdfeLjvX5onOt5mN6/NrVcsyHqtVnJw7/yR4DRKodxWlck4hbV27B
	 TFR+jwPiOWViFAfGKvvrJLUj6Vh8oFlTDhjb+FNNnyPkm2mRqjlm0CPa0W7EK5xheI
	 NtqKvnZcKEt1BaG3C7I14pEv9h8YmbK6lgEq3NyGEqz+fWQvcXvHw/TQ46+tmFVAFA
	 5nnWrUOQSAjhoLqIQLJXa+FSOwgQ5ejVUuiVsn1USfgA8oHLq+FmpXxD6+BjXNjf8/
	 DlxT3TNPGhDiA==
Date: Wed, 16 Apr 2025 11:03:12 +0300
From: Eric Toombs <eric@toombs.earth>
To: linux-sound@vger.kernel.org
Subject: BUG: On output devices, snd_pcm_open() makes a nasty loud tick.
Message-ID: <Z_9kQHrT_Pt3U7WS@robert>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Minimal reproduction:

#include <alsa/asoundlib.h>
#include <stdbool.h>
int main(int argc, const char **argv)
{
    snd_pcm_t *out;
    assert(snd_pcm_open(&out,
                "default",
                SND_PCM_STREAM_PLAYBACK,
                false         // iff nonblocking stream
                ) == 0);
}

(Compile with gcc -o test test.c -lasound.)

Relevant lspci:

00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)

uname:

Linux robert 6.13.8-arch1-1 #1 SMP PREEMPT_DYNAMIC Sun, 23 Mar 2025 17:17:30 +0000 x86_64 GNU/Linux

alsa-lib version: 1.2.13-1 (archlinux)

I've heard similar artefacts on many different sound cards, though, across many different architectures, always on linux.
One must wait about five minutes in between trials, or the artefact does not occur.

This isn't a minor detail.
The tick is very loud and very awful.
It might even damage speakers in a worst case scenario.

This started as [a bug in alsa-lib](https://github.com/alsa-project/alsa-lib/issues/451).
They say it's a kernel issue, though.
So, here I am.
