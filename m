From: "Markus Rechberger" <mrechberger@gmail.com>
Date: Sun, 03 Jun 2007 20:17:15 +0000
Subject: Re: Fading in a .wav file?
Message-Id: <d9def9db0706031317t60d4370dl3674739df2b2ce1e@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20070603192704.GA1888@lnx2>
In-Reply-To: <20070603192704.GA1888@lnx2>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On 6/3/07, Hal <haltec@kvinet.com> wrote:
>
>         Greetings: I have a 3 minute .wav file that "bumps" in, so wanted to
> "soften" or fade in the beginning, making a copy..
>
>         How would you do that aside from transferring to analogue?? The file
> is "standard" 41000 stereo.. TIA..
>

you could use SDL for playing the file, and SDL could do all the work
for you, I'm sure there are quite a few libraries out there which can
do that for you. You might decrease the value of the sine curve to
lower the volume.

Markus
> --
>
>                  Hal        GNU/Linux - Slackware 10.2, 2.4.31
> .
> -
> To unsubscribe from this list: send the line "unsubscribe linux-sound" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Markus Rechberger
