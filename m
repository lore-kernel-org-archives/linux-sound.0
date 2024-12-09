Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D991223709
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746393; cv=none; b=qWGARMPFjUBEDQ+pZVWTpd33v5Tzd6gGFr1/nzW6eigh+vr273A9crhV6hDfSNMfYgUef/wVF3RsEOByF1xZvOMiSRgDAP7XGjGeq3I2KjhT+vEsz1QCFL0uHRQXMZ7G2GmptbhLTyrcCRD+CLs1c/kB7lEQofvWAud9lxlg3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746393; c=relaxed/simple;
	bh=ibk9xsLr57aNUrNUX4WCqnf94EjUyNZEylDf8xp8B98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX9eSPwYteExpsIwThghYEkcmPzuakhvJKSuxvtdlVgOj6nAaQ20Ie7zzT/NwiP+qJJoTz1p5NFDeHx2ZMXNT4uKp0y1EBvCzbdOndu/DJ0Oqm+MbHwaRqLvICgWLbdGX706sMIJsMhqBMXQm0gQAwWpXHb6afFKgMCkSHpJSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=RRf9hzEM; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="RRf9hzEM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date; bh=P2d+3+4XSXi6hRRtK1C6t71SFkOTrYbkAQZz26kIPWQ=; b=RRf9hzEMVChekhJ
	sNf3UaafNy798y65EwDngvDtvCJ2ZnxDmRbgvwWafoupo5Sd2AT/w5KzrqIFTiZTXBPdTL9vVnvYs
	e61dx2biki4SFvccuJYPgPbNkGWi7ivD4flfs+W+kY1vIF5NctO3qzr4Su2dFBtSmYmDsbKlaUtS+
	IP2QvxpJXodfbyoxJ1cVBAjKL0A9M7+p24yiWcob0l7lvM0q2b7KPFqLmk2uKSr2hInvU6mlRTiYm
	ik4jW3TM5GS01AbPPmp9Pd7yR9swYi7jSGtwtYAFvsr6Epk6+m0dvNDuvMNktmHglymsDBWOgshPy
	xTbIQqH02YIKUxqz9dQ==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-01a0b56912a406c78) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tKcdJ-000000006ra-3S5g ;
	Mon, 09 Dec 2024 12:13:01 +0000
Received: from [220.233.184.101] (helo=rpi5)
	 by CMR-KAKADU03.i-01a0b56912a406c78 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tKcdJ-000000002Gw-19ZV;
	Mon, 09 Dec 2024 12:13:01 +0000
Date: Mon, 9 Dec 2024 23:12:58 +1100
From: Stephen Gordon <gordoste@iinet.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
Message-ID: <20241209231258.22f3902f@rpi5>
In-Reply-To: <878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
 <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
 <c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
 <3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
 <20241207125222.7aeedbf6@rpi5>
 <878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/NVXqywoLNyuaRi19.r8cxcI"
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=WPh5XGsR c=1 sm=1 tr=0 ts=6756decd a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=yC-0_ovQAAAA:8 a=8SAdY0oZuShKuPaM7AUA:9 a=CjuIK1q_8ugA:10 a=dOE6bjodWPtpq46irDwA:9 a=K434X8yMGOQHct7TzScA:9
X-Cm-Envelope: MS4xfBdPLBegNPMCRusxHtCT/YRttdmJtgtFqdbmzdH9fUnbUibQbl3Sn4eckuC13rpO2Wo5gT5xlMt07cLUzP3UoSQMgQLhgsZGFLHIf06rB7kyVptD4LMT kXNFff25yqMlroBjmYRW7srBlYbmGwCYu7P0R9HeiyjoCt42eT+E3WXl9yXqKziJ2ZOoRUUrnr4C5XUURKZDky0Z3dZ4wFZTjrI=
X-atmailcloud-route: unknown

--MP_/NVXqywoLNyuaRi19.r8cxcI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 9 Dec 2024 01:58:59 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Stephen
> 
> > > You should use one of the audio-graph-card bindings for anything
> > > new.  
> 
> Using audio-graph-card is good idea, but all
> simple_card/audio-graph-card/audio-graph-card2 are using same logic
> around here. So, you will have same issue on audio-graph-card too.
> 
> > > > Basically, simple_card appears to set the CPU as producer if you
> > > > don't specify a producer. I am not sure whether this is a bug.
> > > >   
> > > 
> > > Well, if nothing is configured it's got to pick a default?  
> 
> If my understand was correct, your issue can be solved...
> 
> 	dailink_out_master: simple-audio-card,dai-link@0 {
> 		...
> =>		pcm3168_playback: codec {  
> 			...
> 		};
> 	};
> 	dailink_in_slave: simple-audio-card,dai-link@1 {
> =>		bitclock-master = <&pcm3168_playback>;
> =>		frame-master    = <&pcm3168_playback>;  
> 		...
> 	};
> 
> asoc_simple_parse_daifmt() is just checking where the node was codec
> node or not. So, if bitclock-master/frame-master were produced, but
> was not codec, both CPU/Codec can be consumer ?
> 
> # Clock producer/consumer settings is very confusable, because it was
> # Codec base, and has flip, etc...
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

Hi Morimoto-san,

This is one of the things I tried initially, but I wasn't sure if it
was a valid configuration. 

I just tried it again with debug enabled (see dt_snippet.txt) and I get
the attached (see dbgout.txt) in dmesg.

It is trying to set the CPU end as producer. I think it's because
asoc_simple_parse_daifmt() checks whether the bit/frame phandles passed
match the codec phandle - since it doesn't (it's a different codec),
it sets the DAI link as "consumer mode" (i.e. clocks come from CPU).
Therefore, the CPU side gets configured as producer.

I am using the  version from 6.12.3 as that is the latest I can
build.

Regards
Stephen







--MP_/NVXqywoLNyuaRi19.r8cxcI
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dbgout.txt

[  688.239375] asoc-simple-card soc@107c000000:sound: link 2, dais 4, ccnf 0
[  688.239394] asoc-simple-card soc@107c000000:sound: link_of (/soc@107c000000/sound/simple-audio-card,dai-link@1)
[  688.267041] asoc-simple-card soc@107c000000:sound: link 2, dais 4, ccnf 0
[  688.267057] asoc-simple-card soc@107c000000:sound: link_of (/soc@107c000000/sound/simple-audio-card,dai-link@1)
[  688.267103] asoc-simple-card soc@107c000000:sound: link_of (/soc@107c000000/sound/simple-audio-card,dai-link@0)
[  688.267128] asoc-simple-card soc@107c000000:sound: Card Name: i2smulti
[  688.267131] asoc-simple-card soc@107c000000:sound: DAI0
[  688.267133] asoc-simple-card soc@107c000000:sound: cpu num = 1
[  688.267136] asoc-simple-card soc@107c000000:sound: cpu slots = 2
[  688.267138] asoc-simple-card soc@107c000000:sound: cpu slot width = 32
[  688.267141] asoc-simple-card soc@107c000000:sound: cpu sysclk = 50000000Hz
[  688.267143] asoc-simple-card soc@107c000000:sound: cpu direction = IN
[  688.267145] asoc-simple-card soc@107c000000:sound: codec num = 1
[  688.267147] asoc-simple-card soc@107c000000:sound: codec slots = 2
[  688.267149] asoc-simple-card soc@107c000000:sound: codec slot width = 32
[  688.267151] asoc-simple-card soc@107c000000:sound: codec sysclk = 24576000Hz
[  688.267153] asoc-simple-card soc@107c000000:sound: codec direction = IN
[  688.267155] asoc-simple-card soc@107c000000:sound: dai name = 1f000a4000.i2s-pcm3168a-adc
[  688.267157] asoc-simple-card soc@107c000000:sound: dai format = 4001
[  688.267160] asoc-simple-card soc@107c000000:sound: DAI1
[  688.267162] asoc-simple-card soc@107c000000:sound: cpu num = 1
[  688.267164] asoc-simple-card soc@107c000000:sound: cpu slots = 2
[  688.267166] asoc-simple-card soc@107c000000:sound: cpu slot width = 32
[  688.267168] asoc-simple-card soc@107c000000:sound: cpu sysclk = 50000000Hz
[  688.267170] asoc-simple-card soc@107c000000:sound: cpu direction = IN
[  688.267172] asoc-simple-card soc@107c000000:sound: codec num = 1
[  688.267174] asoc-simple-card soc@107c000000:sound: codec slots = 2
[  688.267175] asoc-simple-card soc@107c000000:sound: codec slot width = 32
[  688.267177] asoc-simple-card soc@107c000000:sound: codec sysclk = 24576000Hz
[  688.267179] asoc-simple-card soc@107c000000:sound: codec direction = IN
[  688.267181] asoc-simple-card soc@107c000000:sound: dai name = 1f000a4000.i2s-pcm3168a-dac
[  688.267183] asoc-simple-card soc@107c000000:sound: dai format = 1001
[  688.267424] designware-i2s 1f000a4000.i2s: ASoC: error at snd_soc_dai_set_fmt on 1f000a4000.i2s: -22
[  688.267596] asoc-simple-card soc@107c000000:sound: probe with driver asoc-simple-card failed with error -22

--MP_/NVXqywoLNyuaRi19.r8cxcI
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dt_snippet.txt

    fragment@2 {
        target = <&sound>;
        __overlay__ {
            compatible = "simple-audio-card";
            #address-cells = <1>;
            #size-cells = <0>;
            i2s-controller = <&i2s_clk_consumer>;
            status="okay";

            simple-audio-card,name = "i2smulti";
            simple-audio-card,format = "i2s";

            dailink_out_master: simple-audio-card,dai-link@0 {
                reg = <0>;
                format = "i2s";
                bitclock-master = <&pcm3168_playback>;
                frame-master = <&pcm3168_playback>;
                cpu  {
                    sound-dai = <&i2s_clk_consumer>;
                    dai-tdm-slot-num = <2>;
                    dai-tdm-slot-width = <32>;
                };
                pcm3168_playback: codec {
                    sound-dai = <&pcm3168a 0>;
                    dai-tdm-slot-num = <2>;
                    dai-tdm-slot-width = <32>;
                };
            };
            dailink_in_slave: simple-audio-card,dai-link@1 {
                reg = <1>;
                format = "i2s";
                bitclock-master = <&pcm3168_playback>;
                frame-master = <&pcm3168_playback>;
                cpu  {
                    sound-dai = <&i2s_clk_consumer>;
                    dai-tdm-slot-num = <2>;
                    dai-tdm-slot-width = <32>;
                };
                pcm3168_capture: codec {
                    sound-dai = <&pcm3168a 1>;
                    dai-tdm-slot-num = <2>;
                    dai-tdm-slot-width = <32>;
                };
             };
        };
    };


--MP_/NVXqywoLNyuaRi19.r8cxcI--
