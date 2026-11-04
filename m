Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.91.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752897;
	b=QuBeg5JAU8hD6eRLxkBQDNQHhgaTT7KsQc6N8JMsmemkT741sdpAuDZEDbxqAoV4FuJ7
	 Ic+r173dg/sd8USk/Pmjz0aBy3pDt7dPZL5dglIrAMtGB8DAubyZLVA54lEYlatqBOU83
	 gP31f9VjyXVl7QiYlA+ExYD7vk+MVUqR/jrm9EYFOW+L9F05D98qrhJAkHpEa0k3oJjyz
	 9wcNgEFWM5xxHgVWzRKcqoimRiitG//T/dOPK5nD53Bo9+ctnkKjqzPXd5QG4x5bqNVvJ
	 +TVrkvlW5ndDo4xm5ZR8+Yn6n+fBtAp2LuxeWZRHPTWXbeQw/NfeFqFcZTVkPXL9tjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752897;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-JNJ;
	bh=97ConwPDRwMbMtTmkOwWCjQTSwiRslAvHm/yhsHrsF8=;
	b=HAYjThavqZcEJn5bBEIPGUnUvxU23pA4uYLj7l3dX3cTIHfs1YDmix5dfOP1fw1Zw7uE
	 rI8kB4zDMLbLPTgVS43k/eokjfkWVBO7fwSwRoRy80WHLkyV2MI9+TFnxx8uVxDwXhJVh
	 zjgkMlLiadqwhlQnHYdgLsRicZMdeJ0Rf89tcWPlioR04TIPT5reQcfPgkJwegAjIN1EX
	 OnhSmJR8FOqSkZnzhoM+34AQn22AN2hr2Z8M3No9u/2paHss73lsYAtxlRCwp9l0WFSyO
	 sRyrf7S9nSnog03dlpQ2tqj5MR6MoyvgLQ5z/9NSElvYT3nFYsIVa5baEGHFcMqZkVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=H056MXzI;
	arc=none smtp.remote-ip=57.103.91.194
Received: from outbound.ci.icloud.com (ci-2003g-snip4-3.eps.apple.com [57.103.91.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE5606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 00:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DE5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=H056MXzI
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-1 (Postfix) with ESMTPS id 7BA7918002DC;
	Wed, 04 Nov 2026 00:41:34 +0000 (UTC)
X-ICL-RepId: 01a1a401-0be0-73dc-92c0-772a0b5a0311
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWBFBRHV8CCgRHBFsXRgNTRVEZFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXAZbBkAJTAJcBEUHRA9PAl8aWh8GUBZQCFkfHBNVF0YZXg5AMFAbXwJCDxwTVhUNTUMSQhUEEVABWB5W
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793752896; x=1825288896; bh=97ConwPDRwMbMtTmkOwWCjQTSwiRslAvHm/yhsHrsF8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=H056MXzIk+WzCi9vY7Q91adVVZtq7El4qbdCfV3IP86O8b1vZywhU+HrYrMR15XvmhX/F7wqLQKMl+u+gEt63Qf5kiwc/78Vto7VYIP9O+RD16QbRqMPNuAtCaSWQbekL6dOBVyKRrVOMTRHVDMkriZb6QrAc2yivGwzpQI3Jgpu4MLahG6JzOlXgq0XS9b3WF5SVzHdkLzcjGq+udmb3ckTyqXMmrTAz48fLjT2ynW7dXqx9+BCPN/G3uVI97gVZcQ5v4+LS/vJbcCzmtJJidCNVWyUdzJ0FyTov5jRRw8fmuqfTVycOCabI9Ea3pjTm+XTzTSmnL+qOp4pDHb8pw==
Received: from bigre.tail98293.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-1 (Postfix) with ESMTPSA id 7933C180051E;
	Wed, 04 Nov 2026 00:41:33 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Vincent Cloutier <vincent@cloutier.co>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Allow HW_REFINE queries with mapped buffers
Date: Tue,  3 Nov 2026 19:40:25 -0500
Message-ID: <20261104004113.546712-1-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <874idyx9n6.wl-tiwai@suse.de>
References: <874idyx9n6.wl-tiwai@suse.de>
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
X-Authority-Info-Out: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=6aea7f3f
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=bEYm-9ale8fJAr3hifAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMSBTYWx0ZWRfX0Hce1/uSrHsC
 aSMqulfCml/YRJ2Ao3VhJR9gIGYck6YkOveNMIeC3defJYU5su5WOyF94RHnJEJGhBdBLZeNHBq
 DyfhJhvoaBNb6e78BVli5dQM+1TxcF6OcPryc5MNEfPg3xAWwHhUaQQpiFEKNRlatjWix8DHEW2
 V+nvLjnHjs0HJmrvONWaeh2jtFXJ8YrJ30aT/Mb95Z38AlAK7O4KEbk4nnNEdx2YGJNZ93tUgWp
 OAB0hdZBffNWzF7rYdGyxREDV4YiazJXxZhRX8Ienb5EvLaXUzKQzN9WXemathRUxj8M48wLpl9
 RjFGkBbasHMsZz6MwNKZxcFqT5huK1NcC59tt+lbEfJ6RN9roXsneGccz/1gc8=
X-Proofpoint-ORIG-GUID: vWv3Lb2O_VaShhjKrtQO2tK45XZHWBvi
X-Proofpoint-GUID: vWv3Lb2O_VaShhjKrtQO2tK45XZHWBvi
X-JNJ: AAAAAAABsoq1lq/3jxT/Bg5KS2FhNikXWroD61wgx1LXbkC9uJ4R2p0aM2aM5qCegzrvPj
 JzKSZ0PMijNitko6BmpvnNPR0txK6KjCCDYpI0BB1QS3iB1U5/1fMbllAlKuqmTItuj1xS
 Un/yvHx8Kj+P1Ik48IOYXXCYJzv5bhFWBSKfrGYHexB7xFlWLPn8Yf+qiiwbhRNLVM6MR2
 nj+d1Q5HAbt64nC5wjhrWOVyYvYyYVLyN5L+xgMW8/86t5wQ6FxYLn9kYFUwZQYzIoEb+N
 Q76G/iMkTNZRWGoqFytF42a46uNGvL7WkTnJ8PRmKI7OLzPqGSwIhUCFeKvzP53oL/8gfU
 ke+eDf94tKcXVwK8su6oSn4vfSa+Ovnhd0CHRgVQHDZblJOv81zyuIEaaUlvyGNzuhwcpI
 vKFBghgU5gfTowsFJSFeScH+rp1kOLYmZzL07Knm+Hy+OMGy1MY6DhCPOG5rPw3TGR5Ym6
 ndEni64B0s1GAmXhZBas5Jl/tY7m5H49ZQmJynh/5E1g8q6Y/NHsqVnJG7bbvbkcJcsWdH
 QlslewHANpS0gQkwIwAjnS330gHPq+gsAyGf+/Q2LTLRK74iEXTCMJHezrhp8yFgRdv6Bp
 jUwBFqiJ+iuu0P1/Dp4SkM6N4WM0S1f3+MbDeeAuFAMvYpN7FxFD5LbVNL40FpyOuEPlEf
 QjB2RIpvhZsR1w4szhmU7lay/za4/llprVDhSG6ekl8GqJYhBuLeGOMWI0xKr72MH+ap82
 O80orM+epwZGgw9VU5LLpF2yLZ/OUfzADX0l/XlTh5V0LR/1E4DWzE9u7fZJnoX3qOJ7j4
 pgyMUJLNRl35t6LkrMG9le0JHOm3lSVsrUGi1O9KCSWhmxsIqbMZYhwLXxiyesgVYabGEA
 UwScY0uu1ttdZQMzoBWd7K5OPfNcgx4hFHhux8HWJiECBYlrwxLiTUz3ClXSVsEMa4OL0d
 wJ5K5XeFbHOffNyQWjLz+99y00/y3gm0pgoe7pbsLcOiwgRPvuvub76avxqCCqvsqfF6I9
 q1EQwV/2YAYUHm3ARY10FR0uhpo4vzJmNwXwU2uzMZj3qDVX7J4m/MIyvihQjqVcKbGuwz
 bmva1B3JOOcaDNh9Q1sJO+W1Ba3zF3mSS9RAHByjQury71WvPmx7cVcIfqslKBseLJXL2z
 HlZS3GyDil52cqNLiOCiAQ0Fvo7jIxax7m4tTyfeJLTMqq6TGED7Xi+iCgu8GPs4yjxsrp
 OY/BoTpuWJFvTvVHtioHN0tszNPe8PktwuzfcTsOCOU83hWRqcdSupdxqrLoOWSohind/C
 4SiHQf7jvkfg==

From: Vincent Cloutier <vincent@cloutier.co>

PulseAudio 16.1 queries supported formats after configuring and mapping
a PCM buffer. Sharing HW_PARAMS' state checker with HW_REFINE causes
these queries to fail with -EBADFD because a non-OSS stream has active
buffer mappings. PulseAudio then fails to create its sinks and sources.

Make the mmap restriction optional in the shared state checker. Keep it
for HW_PARAMS, which can reconfigure the mapped buffer, but skip it for
HW_REFINE, which only refines the caller's constraint structure. Keep
the stream-state checks and buffer access locking for native, compat
and legacy refinement ioctls rather than bypassing their wrapper.
Leave the accepted stream states unchanged.

On Librem 5, both L5 and Modem cards reproduce the failure for playback
and capture: refinement succeeds before setup and after RW setup, but
fails after MMAP setup in PREPARED state. With this change, all eight
cases pass, PulseAudio starts normally and audible playback works.
The reproducer does not start streams or transfer audio data.

Fixes: ad28d2f607d1 ("ALSA: pcm: Serialize and check HW_REFINE ioctls")
Link: https://lore.kernel.org/linux-sound/41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de/
Link: https://lore.kernel.org/linux-sound/874idyx9n6.wl-tiwai@suse.de/
Assisted-by: OpenCode:GPT-6.1 Sol
Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
---
 sound/core/pcm_native.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5cbf88da7626..01d9f5ad4ea9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -776,14 +776,15 @@ static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
 					    usecs);
 }
 
-static int hw_params_state_check(struct snd_pcm_substream *substream)
+static int hw_params_state_check(struct snd_pcm_substream *substream,
+				 bool check_mmap)
 {
 	guard(pcm_stream_lock_irq)(substream);
 	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
-		if (!is_oss_stream(substream) &&
+		if (check_mmap && !is_oss_stream(substream) &&
 		    atomic_read(&substream->mmap_count))
 			return -EBADFD;
 		return 0;
@@ -806,7 +807,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	err = snd_pcm_buffer_access_lock(runtime);
 	if (err < 0)
 		return err;
-	err = hw_params_state_check(substream);
+	err = hw_params_state_check(substream, true);
 	if (err)
 		goto unlock;
 
@@ -944,7 +945,8 @@ static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
 	err = snd_pcm_buffer_access_lock(runtime);
 	if (err < 0)
 		return err;
-	err = hw_params_state_check(substream);
+	/* Refinement queries constraints without changing the mapped buffer. */
+	err = hw_params_state_check(substream, false);
 	if (err)
 		goto unlock;
 

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.56.0

