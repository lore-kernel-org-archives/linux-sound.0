Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB44A21
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758964824; cv=none; b=J/P6eYfIsOAbiT84jCPSxwZDdaWAA4vIYnkPCnJjJd/agvJ5kK6mLNue2oDDssUz9g0XYpi/X4xkF97HpEsFPZ6BXY+OQSh/+W4K8zOtB4aAZFxBcrc5C152z291oPcI7cW/eKSH8RBWy0ZU0rtQ6PGBjt/iS4g9w9lXPWTlvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758964824; c=relaxed/simple;
	bh=OWIMR0L5vkff4Ys/9AAqmy1jpmGTpcfS/mJh7BqMR5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfjPkHfSve9PWIoUdgtnQ2PEQPLSLKgd+/ilTON/V1F9E2zZ2SD0ImerJc3zZVk25ws56uVNlwE5YZ6a5EAPF3IGVW9/FehcFIuF8QOYSQfzS3MHarPlae4gJgS2jTwqspnn1d2CETO2A92O4saiCZX3aipUKEtRQKoIuYcuFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=tnmB7j/O; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="tnmB7j/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1758964820;
	bh=j/01ePzQPDKPh07IXh1FLzg373Fq7gj6Elmi7oXim6E=;
	h=From:Subject:Date:Message-ID;
	b=tnmB7j/OeOlBceyBFRS4zbE7n6xQYsCbk+e1NQmyI2/dxPQtyvkGzP4OSKSWfJ209
	 km5FDg7OSMZUGMpHfdK5NvOY/9seIYsY5PndU7ZaG7clTvcTUuhvqbvZoUg8sXk3/h
	 AW9qkEBrTcwCExYPkaONURKlMIhpHKKMn+LuHNSQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 68D7AC2B0000679D; Sat, 27 Sep 2025 17:19:41 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2410786292040
X-SMAIL-UIID: 84B51BDFE84749BCA5154F6B87C6AF64-20250927-171941-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jeongjun Park <aha310510@gmail.com>,
	clemens@ladisch.de,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
Date: Sat, 27 Sep 2025 17:19:29 +0800
Message-ID: <20250927091931.7691-1-hdanton@sina.com>
In-Reply-To: <87bjmwb9y6.wl-tiwai@suse.de>
References: 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 27 Sep 2025 10:01:37 +0200 Takashi Iwai wrote:
>On Sat, 27 Sep 2025 06:41:06 +0200 Jeongjun Park wrote:
>> 
>> The previous commit 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at
>> removal") patched a UAF issue caused by the error timer.
>> 
>> However, because the error timer kill added in this patch occurs after the
>> endpoint delete, a race condition to UAF still occurs, albeit rarely.
>> 
>> Therefore, to prevent this, the error timer must be killed before freeing
>> the heap memory.
>> 
>> Cc: <stable@vger.kernel.org>
>> Fixes: 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at removal")
>> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
>
> I suppose it's a fix for the recent syzbot reports?
>   https://lore.kernel.org/68d17f44.050a0220.13cd81.05b7.GAE@google.com
>   https://lore.kernel.org/68d38327.a70a0220.1b52b.02be.GAE@google.com

#syz test upstream master

--- x/sound/usb/midi.c
+++ y/sound/usb/midi.c
@@ -1522,6 +1522,8 @@ static void snd_usbmidi_free(struct snd_
 {
 	int i;
 
+	timer_shutdown_sync(&umidi->error_timer);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
 		if (ep->out)
@@ -1530,7 +1532,6 @@ static void snd_usbmidi_free(struct snd_
 			snd_usbmidi_in_endpoint_delete(ep->in);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
--
