Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103B248886;
	Mon, 26 Jan 2026 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458460; cv=none; b=VGFVmph9zw0h9TyaNE16lIhQm80z7m778bdUeTfTR88NULpD46aaXRRzuS/pD+WUApz9Nloyq1izCBcZn/mASdGhGnoWvn8FEm/dsNnFvoSAsz0HuJe8A/eInxXUaynEXwh+rXffRs3D0Wdww6iiJT5dyf3TW5baCcAyxAis2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458460; c=relaxed/simple;
	bh=HgPb0w1QMDqfBsgsRmL/JDZmjKY4pLriTJaTBpfCPYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdeaQD4mhN5ZVJLBoFjJ3JioRTjfxRA1iFjYvBX3/K3MmPsMpmxT+CzGXK9K38NyJ/9gBX05ifvPyxceBgTkbJUk4IRuUIsj6xFzDnr9z/4pdHaeBQ2Ss44C4vVj3zoHefmEGSwF49MMaDhS5I18NFDAHAn89pzgN+M7PIvTOs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=iq43ylH2; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="iq43ylH2"
Received: from [192.168.0.182] (unknown [61.8.158.207])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 196902FC004A;
	Mon, 26 Jan 2026 21:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769458449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNxG8TaQWc7bHgtaasX7A4xbdys46y0+lR7elW4/NzI=;
	b=iq43ylH2qRFCG2By0zan4gLXo1XQHeQb3Is2r6ckV6HFPA2t8oPw9OjU/87LO+PdmK/l2A
	oYiY3JdAFpkxM53j5TiVKvH9U1AJLlupDHyMFaUvFEpDgnuCzamYmi0AZk2Pk3L/Uhzi3W
	mOwR+6DOIO316eWNkV3nzExAeRJRY4k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e5a7b943-58cf-4f1e-b006-9ab7f944e115@tuxedocomputers.com>
Date: Mon, 26 Jan 2026 21:14:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda/realtek: Really fix headset mic for TongFang
 X6AR55xU.
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123221233.28273-1-wse@tuxedocomputers.com>
 <87jyx7co0f.wl-tiwai@suse.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87jyx7co0f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 24.01.26 um 11:18 schrieb Takashi Iwai:
> On Fri, 23 Jan 2026 23:12:24 +0100,
> Werner Sembach wrote:
>> Add a PCI quirk to enable microphone detection on the headphone jack of
>> TongFang X6AR55xU devices.
>>
>> The former quirk entry did not acomplish this and is removed.
>>
>> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Applied now (with manually added Fixes tag).  Thanks.
Ah, deep sorry i forgot that.
>
>
> Takashi
